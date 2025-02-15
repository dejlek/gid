//!kind loader Namespace

import std.path : buildPath;
import std.process : environment;
import std.string : fromStringz, toStringz;

version(Windows)
{
	import core.sys.windows.winbase : LoadLibraryA, GetProcAddress, FreeLibrary, GetLastError, FormatMessageA,
				FORMAT_MESSAGE_FROM_SYSTEM, FORMAT_MESSAGE_IGNORE_INSERTS;
	import core.sys.windows.winnt : LANG_NEUTRAL, IMAGE_FILE_MACHINE_AMD64, IMAGE_FILE_MACHINE_I386;
	import std.algorithm : splitter;

	extern(Windows) int SetDllDirectoryA(const(char)* path);

  void gidLink(T)(ref T funcPtr, string symbol, immutable(string[]) libs)
  {
		static bool dllPathSet;

		if (!dllPathSet && libs.length > 0)
		{
			outer: foreach (lib; libs[0].splitter(";"))
			{
				foreach (path; environment.get("PATH").splitter(';'))
				{
					string dllPath = buildNormalizedPath(path, lib);

					if (exists(dllPath) && checkArchitecture(dllPath))
					{
						SetDllDirectoryA(toStringz(dllPath));
						dllPathSet = true;
						break outer;
					}
				}
			}
		}

    foreach (libVariations; libs) // Loop on each library
    {
			foreach (lib; libVariations.splitter(";")) // Loop on library name variations (separated by ';' - windows only)
			{
				if (auto handle = LoadLibraryA(cast(char*)toStringz(lib)))
				{
					if (auto symPtr = GetProcAddress(handle, cast(char*)toStringz(symbol)))
					{
						funcPtr = cast(T)symPtr;
						return;
					}
				}
				else
					throw new Error("Failed to load library '" ~ lib ~ "': " ~ getErrorMessage);
			}
    }

    funcPtr = cast(T)&symbolNotFound;
  }

	private string getErrorMessage()
	{
		char[] buffer = new char[2048];
		buffer[0] = '\0';

		FormatMessageA(FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS, null, GetLastError(), LANG_NEUTRAL,
			buffer.ptr, cast(uint)buffer.length, null);

		return buffer.ptr.fromStringz.idup;
	}

	// Verify a DLL matches the current host architecture
	private bool checkArchitecture(string dllPath)
	{
		import std.stdio : File;
		File dll = File(dllPath);
		uint[1] ubuf;
		ushort[1] shbuf;

		dll.seek(0x3c);
		int offset = dll.rawRead(ubuf)[0];
		dll.seek(offset);
		uint peHead = dll.rawRead(ubuf)[0];

		if (peHead != 0x00004550) // Not a PE Header
			return false;

		ushort type = dll.rawRead(shbuf)[0];

		version(Win32)
			return type == IMAGE_FILE_MACHINE_I386;
		else version(Win64)
			return type == IMAGE_FILE_MACHINE_AMD64;
		else
			return false;
	}
}
else // Linux or OSX
{
  import core.sys.posix.dlfcn : dlerror, dlopen, dlsym, RTLD_GLOBAL, RTLD_NOW;

  void gidLink(T)(ref T funcPtr, string symbol, immutable(string[]) libs)
  {
    foreach (lib; libs)
    {
			version (OSX) lib = lib.buildPath(basePath, lib);

     	if (auto handle = dlopen(cast(char*)toStringz(lib), RTLD_GLOBAL | RTLD_NOW))
      {
        if (auto symPtr = dlsym(handle, cast(char*)toStringz(symbol)))
        {
          funcPtr = cast(T)symPtr;
          return;
        }
      }
      else
        throw new Error("Failed to load library '" ~ lib ~ "': " ~ dlerror().fromStringz.idup);
    }

    funcPtr = cast(T)&symbolNotFound;
  }

	version(OSX)
	{
		string basePath()
		{
			static string path;

			if (path is null)
			{
				path = environment.get("GTK_BASEPATH");

				if(!path)
				{
					path = environment.get("HOMEBREW_ROOT");

					if (path)
						path = path.buildPath("lib");
				}
			}

			return path;
		}
	}
}

private void symbolNotFound()
{
  throw new Error("Attempted to execute a dynamic library function which was not found");
}
