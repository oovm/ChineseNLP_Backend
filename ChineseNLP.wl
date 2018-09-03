Needs["JLink`"];
SetOptions[InstallJava, JVMArguments -> "-Xmx2g"];
SetOptions[ReinstallJava, JVMArguments -> "-Xmx2g"];
If[!TrueQ[ChineseNLP`PackageScope`Private`$LoadCompleted],
	<< ChineseNLP`ChineseNLPLoader`
];
SetDirectory@FileNameJoin[{$UserBaseDirectory, "ApplicationData", "ChineseNLP","HanLP"}];
ReinstallJava[ClassPath -> "HanLP-1.6.8.jar"];
SetDirectory@$HomeDirectory;
