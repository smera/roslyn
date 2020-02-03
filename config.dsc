config({
    resolvers: [
        {
            kind: "MsBuild",
            moduleName: "Compilers",
            root: d`.`,
            msBuildSearchLocations: [d`C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\MSBuild\Current\Bin`],
            fileNameEntryPoints: [r`Compilers.sln`],

            // The following are the required env variables the repo needs
            environment: Map.empty<string, string>()
                            .add("Path", Environment.getStringValue("PATH"))
                            .add("USERPROFILE", Environment.getStringValue("USERPROFILE"))
                            // Env vars that redirect the SDK lookup to point to the latest available
                            // .add("DOTNET_INSTALL_DIR", Environment.getStringValue("DOTNET_INSTALL_DIR"))
                            // .add("DOTNET_MULTILEVEL_LOOKUP", Environment.getStringValue("DOTNET_MULTILEVEL_LOOKUP"))
                            // .add("SDK_REPO_ROOT", Environment.getStringValue("SDK_REPO_ROOT"))
                            // .add("SDK_CLI_VERSION", Environment.getStringValue("SDK_CLI_VERSION"))
                            // .add("MSBuildSDKsPath", Environment.getStringValue("MSBuildSDKsPath"))
                            // .add("DOTNET_MSBUILD_SDK_RESOLVER_SDKS_DIR", Environment.getStringValue("DOTNET_MSBUILD_SDK_RESOLVER_SDKS_DIR"))
                            // .add("NETCoreSdkBundledVersionsProps", Environment.getStringValue("NETCoreSdkBundledVersionsProps"))
                            // .add("MicrosoftNETBuildExtensionsTargets", Environment.getStringValue("MicrosoftNETBuildExtensionsTargets"))
                            // .add("DOTNET_ROOT", Environment.getStringValue("DOTNET_ROOT"))
                            .add("ALLUSERSPROFILE", Environment.getStringValue("ALLUSERSPROFILE"))
                            .add("APPDATA", Environment.getStringValue("APPDATA"))
                            .add("CloudbuildToolsFlavor", Environment.getStringValue("CloudbuildToolsFlavor"))
                            .add("CommandPromptType", Environment.getStringValue("CommandPromptType"))
                            .add("CommonProgramFiles", Environment.getStringValue("CommonProgramFiles"))
                            .add("CommonProgramFiles(x86)", Environment.getStringValue("CommonProgramFiles"))
                            .add("CommonProgramW6432", Environment.getStringValue("CommonProgramW6432"))
                            .add("COMPUTERNAME", Environment.getStringValue("COMPUTERNAME"))
                            .add("ComSpec", Environment.getStringValue("ComSpec"))
                            .add("COR_ENABLE_PROFILING", Environment.getStringValue("COR_ENABLE_PROFILING"))
                            .add("COR_PROFILER", Environment.getStringValue("COR_PROFILER"))
                            .add("DevEnvDir", Environment.getStringValue("DevEnvDir"))
                            .add("DriverData", Environment.getStringValue("DriverData"))
                            .add("ExtensionSdkDir", Environment.getStringValue("ExtensionSdkDir"))
                            .add("Framework40Version", Environment.getStringValue("Framework40Version"))
                            .add("FrameworkDir", Environment.getStringValue("FrameworkDir"))
                            .add("FrameworkDIR32", Environment.getStringValue("FrameworkDIR32"))
                            .add("FrameworkVersion", Environment.getStringValue("FrameworkVersion"))
                            .add("FrameworkVersion32", Environment.getStringValue("FrameworkVersion32"))
                            .add("FSHARPINSTALLDIR", Environment.getStringValue("FSHARPINSTALLDIR"))
                            .add("HOMEDRIVE", Environment.getStringValue("HOMEDRIVE"))
                            .add("HOMEPATH", Environment.getStringValue("HOMEPATH"))
                            .add("INCLUDE", Environment.getStringValue("INCLUDE"))
                            .add("LIB", Environment.getStringValue("LIB"))
                            .add("LIBPATH", Environment.getStringValue("LIBPATH"))
                            .add("LOCALAPPDATA", Environment.getStringValue("LOCALAPPDATA"))
                            .add("LOGONSERVER", Environment.getStringValue("LOGONSERVER"))
                            .add("NETFXSDKDir", Environment.getStringValue("NETFXSDKDir"))
                            .add("NugetMachineInstallRoot", Environment.getStringValue("NugetMachineInstallRoot"))
                            .add("NUGET_PACKAGES", Environment.getStringValue("NUGET_PACKAGES"))
                            .add("NUMBER_OF_PROCESSORS", Environment.getStringValue("NUMBER_OF_PROCESSORS"))
                            .add("OneDrive", Environment.getStringValue("OneDrive"))
                            .add("OS", Environment.getStringValue("OS"))
                            .add("Path", Environment.getStringValue("Path"))
                            .add("PATHEXT", Environment.getStringValue("PATHEXT"))
                            .add("PROCESSOR_ARCHITECTURE", Environment.getStringValue("PROCESSOR_ARCHITECTURE"))
                            .add("PROCESSOR_IDENTIFIER", Environment.getStringValue("PROCESSOR_IDENTIFIER"))
                            .add("PROCESSOR_LEVEL", Environment.getStringValue("PROCESSOR_LEVEL"))
                            .add("PROCESSOR_REVISION", Environment.getStringValue("PROCESSOR_REVISION"))
                            .add("ProgramData", Environment.getStringValue("ProgramData"))
                            .add("ProgramFiles", Environment.getStringValue("ProgramFiles"))
                            .add("ProgramFiles(x86)", Environment.getStringValue("ProgramFiles"))
                            .add("ProgramW6432", Environment.getStringValue("ProgramW6432"))
                            .add("PROMPT", Environment.getStringValue("PROMPT"))
                            .add("PSModulePath", Environment.getStringValue("PSModulePath"))
                            .add("PUBLIC", Environment.getStringValue("PUBLIC"))
                            .add("SESSIONNAME", Environment.getStringValue("SESSIONNAME"))
                            .add("SystemDrive", Environment.getStringValue("SystemDrive"))
                            .add("SystemRoot", Environment.getStringValue("SystemRoot"))
                            .add("TEMP", Environment.getStringValue("TEMP"))
                            .add("Test", Environment.getStringValue("Test"))
                            .add("TMP", Environment.getStringValue("TMP"))
                            .add("UATDATA", Environment.getStringValue("UATDATA"))
                            .add("UCRTVersion", Environment.getStringValue("UCRTVersion"))
                            .add("UniversalCRTSdkDir", Environment.getStringValue("UniversalCRTSdkDir"))
                            .add("USERDNSDOMAIN", Environment.getStringValue("USERDNSDOMAIN"))
                            .add("USERDOMAIN", Environment.getStringValue("USERDOMAIN"))
                            .add("USERDOMAIN_ROAMINGPROFILE", Environment.getStringValue("USERDOMAIN_ROAMINGPROFILE"))
                            .add("USERNAME", Environment.getStringValue("USERNAME"))
                            .add("USERPROFILE", Environment.getStringValue("USERPROFILE"))
                            .add("VCIDEInstallDir", Environment.getStringValue("VCIDEInstallDir"))
                            .add("VCINSTALLDIR", Environment.getStringValue("VCINSTALLDIR"))
                            .add("VCToolsInstallDir", Environment.getStringValue("VCToolsInstallDir"))
                            .add("VCToolsRedistDir", Environment.getStringValue("VCToolsRedistDir"))
                            .add("VCToolsVersion", Environment.getStringValue("VCToolsVersion"))
                            .add("VisualStudioVersion", Environment.getStringValue("VisualStudioVersion"))
                            .add("VS140COMNTOOLS", Environment.getStringValue("VS140COMNTOOLS"))
                            .add("VS160COMNTOOLS", Environment.getStringValue("VS160COMNTOOLS"))
                            .add("VSCMD_ARG_app_plat", Environment.getStringValue("VSCMD_ARG_app_plat"))
                            .add("VSCMD_ARG_HOST_ARCH", Environment.getStringValue("VSCMD_ARG_HOST_ARCH"))
                            .add("VSCMD_ARG_TGT_ARCH", Environment.getStringValue("VSCMD_ARG_TGT_ARCH"))
                            .add("VSCMD_VER", Environment.getStringValue("VSCMD_VER"))
                            .add("VSINSTALLDIR", Environment.getStringValue("VSINSTALLDIR"))
                            .add("VSSDK150INSTALL", Environment.getStringValue("VSSDK150INSTALL"))
                            .add("VSSDKINSTALL", Environment.getStringValue("VSSDKINSTALL"))
                            .add("windir", Environment.getStringValue("windir"))
                            .add("WindowsLibPath", Environment.getStringValue("WindowsLibPath"))
                            .add("WindowsSdkBinPath", Environment.getStringValue("WindowsSdkBinPath"))
                            .add("WindowsSdkDir", Environment.getStringValue("WindowsSdkDir"))
                            .add("WindowsSDKLibVersion", Environment.getStringValue("WindowsSDKLibVersion"))
                            .add("WindowsSdkVerBinPath", Environment.getStringValue("WindowsSdkVerBinPath"))
                            .add("WindowsSDKVersion", Environment.getStringValue("WindowsSDKVersion"))
                            .add("WindowsSDK_ExecutablePath_x64", Environment.getStringValue("WindowsSDK_ExecutablePath_x64"))
                            .add("WindowsSDK_ExecutablePath_x86", Environment.getStringValue("WindowsSDK_ExecutablePath_x86"))
                            .add("__DOTNET_ADD_32BIT", Environment.getStringValue("__DOTNET_ADD_32BIT"))
                            .add("__DOTNET_PREFERRED_BITNESS", Environment.getStringValue("__DOTNET_PREFERRED_BITNESS"))
                            .add("__VSCMD_PREINIT_PATH", Environment.getStringValue("__VSCMD_PREINIT_PATH"))
                            // Env vars that are used to run the test infrastructure
                            .add("testDesktop", Environment.getStringValue("testDesktop"))
                            .add("testIOperation", Environment.getStringValue("testIOperation"))
                            .add("testVsi", Environment.getStringValue("testVsi"))
                            .add("ci", Environment.getStringValue("ci"))
                            .add("test32", Environment.getStringValue("test32"))
                            .add("runTestArgs", Environment.getStringValue("runTestArgs"))
                            .add("runTestsExe", Environment.getStringValue("runTestsExe"))
                            .add("TestUsingOptimizedRunner", Environment.getStringValue("TestUsingOptimizedRunner")),

            // These global properties are originally passed with /p by build.cmd
            globalProperties: Map.empty<string, string>()
                                .add("configuration", Environment.getStringValue("configuration"))
                                //.add("projects", Environment.getStringValue("projects"))
                                .add("repoRoot", Environment.getStringValue("repoRoot"))
                                .add("restore", Environment.getStringValue("restore"))
                                .add("build", Environment.getStringValue("build"))
                                .add("testCoreClr", Environment.getStringValue("testCoreClr"))
                                .add("rebuild", Environment.getStringValue("rebuild"))
                                .add("pack", Environment.getStringValue("pack"))
                                .add("sign", Environment.getStringValue("sign"))
                                .add("publish", Environment.getStringValue("publish"))
                                .add("ContinuousIntegrationBuild", Environment.getStringValue("ci"))
                                // Passing an empty string is not well received
                                //.add("officialBuildId", Environment.getStringValue("officialBuildId"))
                                .add("UseRoslynAnalyzers", Environment.getStringValue("enableAnalyzers"))
                                .add("bootstrapDir", Environment.getStringValue("bootstrapDir"))
                                // We are not doing this as of now, need to plumb warnAsError
                                // $msbuildWarnAsError = if ($warnAsError) { "/warnAsError:MSB3270,MSB3277" } else { "" }. 
                                .add("VisualStudioIbcSourceBranchName", Environment.getStringValue("ibcSourceBranchName"))
                                .add("VisualStudioIbcDropId", Environment.getStringValue("ibcDropId"))
                                .add("EnableNgenOptimization", Environment.getStringValue("applyOptimizationData"))
                                .add("IbcOptimizationDataDir", Environment.getStringValue("ibcDir"))
                                .add("DeployExtension", Environment.getStringValue("suppressExtensionDeployment") !== "" ? "false" : "true"),
                                //.add("DotNetBuildFromSource", Environment.getStringValue("buildFromSource") !== "" ? "true" : "false"),
                                // We are not passing arbitrary properties for now
                                // @properties. 

            enableBinLogTracing: false,// Environment.hasVariable("BL") && Environment.getStringValue("BL") !== "",

            untrackedFiles: [f`artifacts\log\Debug\runtests.log`],
            useManagedSharedCompilation: true,
        },  
    ],
    disableDefaultSourceResolver: true, 
});