config({
    resolvers: [
        {
            kind: "MsBuild",
            moduleName: "Compilers",
            root: d`.`,
            fileNameEntryPoints: [r`Compilers.sln`],
            useManagedSharedCompilation: true,
        },  
    ],
    disableDefaultSourceResolver: true,
});
