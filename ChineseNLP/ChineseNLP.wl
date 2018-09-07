Needs["JLink`"];
SetOptions[JLink`InstallJava, JLink`JVMArguments -> "-Xmx2g"];
SetOptions[JLink`ReinstallJava, JLink`JVMArguments -> "-Xmx2g"];
SetDirectory@FileNameJoin[{$UserBaseDirectory, "Applications", "ChineseNLP", "Resources"}];
JLink`ReinstallJava[JLink`ClassPath -> "JLink-ChineseNLP.jar"];
If[!TrueQ[ChineseNLP`PackageScope`Private`$LoadCompleted],
	<< ChineseNLP`ChineseNLPLoader`
];
SetDirectory@$HomeDirectory;
