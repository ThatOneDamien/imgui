project "ImGui"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"

	targetdir ("bin/" .. outdir .. "/%{prj.name}")
	objdir ("bin/int/" .. outdir .. "/%{prj.name}")

	files
	{
		"imconfig.h",
        "imgui.h",
        "imgui.cpp",
        "imgui_draw.cpp",
        "imgui_internal.h",
        "imgui_widgets.cpp",
        "imstb_rectpack.h",
        "imstb_truetype.h",
        "imstb_textedit.h",
        "imgui_demo.cpp",
        "imgui_tables.cpp"
	}

	filter "system:linux"
		pic "on"

	filter "system:macosx"
		pic "on"

	filter "system:windows"
		systemversion "latest"
		staticruntime "on"

    filter {"system:windows", "configurations:Release"}
        buildoptions "/MT"
		
	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
