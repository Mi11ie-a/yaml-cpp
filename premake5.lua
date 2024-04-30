project "YAML-Cpp"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.cpp",
        "src/**.h",

        "include/**.h"
	}

    defines
    {
        "YAML_CPP_STATIC_DEFINE",
        "YAML_BUILD_SHARED_LIBS=OFF"
    }

    includedirs
    {
        "include"
    }

	filter "system:windows"
		systemversion "latest"
		staticruntime "off"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		staticruntime "off"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter {"configurations:Dist"}
        runtime "Release"
        optimize "on"
			
	filter "configurations:Release"
		runtime "Release"
		optimize "on"