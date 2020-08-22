	
		project "App_Dekrispator"

		language "C++"
				
		kind "ConsoleApp"

  	includedirs {
                ".",
                "../../stk/include",
                "../../CloudSeed",
                }
			
		links{ "stk", "CloudSeed"}
		defines {"__STK_REALTIME__"}	
		files {
		"**.cpp",
		"*.c",
		"**.h",
		}

		if os.is("Windows") then
			links {"winmm","Wsock32","dsound"}
			defines {"WIN32","__WINDOWS_MM__","__LITTLE_ENDIAN__","__WINDOWS_DS__"}
		end

		
if os.is("Linux") then initX11() 
                defines  {"__OS_LINUX__","__LINUX_ALSA__","__LITTLE_ENDIAN__"}
	links {"asound","pthread"}
end


if os.is("MacOSX") then
	links{"Cocoa.framework"}
	links{"CoreAudio.framework", "coreMIDI.framework", "Cocoa.framework"}

	defines {"__OS_MACOSX__","__LITTLE_ENDIAN__"}
end

