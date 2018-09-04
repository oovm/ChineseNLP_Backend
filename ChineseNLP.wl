Needs["JLink`"];
SetOptions[JLink`InstallJava, JLink`JVMArguments -> "-Xmx2g"];
SetOptions[JLink`ReinstallJava, JLink`JVMArguments -> "-Xmx2g"];
SetDirectory@FileNameJoin[{$UserBaseDirectory, "ApplicationData", "ChineseNLP","HanLP"}];
JLink`ReinstallJava[JLink`ClassPath -> "HanLP-1.6.8x.jar"];
If[!TrueQ[ChineseNLP`PackageScope`Private`$LoadCompleted],
	<< ChineseNLP`ChineseNLPLoader`
];
SetDirectory@$HomeDirectory;
