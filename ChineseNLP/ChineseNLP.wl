Needs["JLink`"];
SetOptions[JLink`InstallJava, JLink`JVMArguments -> "-Xmx2g"];
SetOptions[JLink`ReinstallJava, JLink`JVMArguments -> "-Xmx2g"];
SetDirectory@FileNameJoin[{$UserBaseDirectory, "Applications", "ChineseNLP", "Resources", "txt"}];
JLink`ReinstallJava[JLink`ClassPath -> FileNameJoin[{ParentDirectory[], "jar", "JLinkClasses.jar"}]];
If[!TrueQ[ChineseNLP`PackageScope`Private`$LoadCompleted],
	<< ChineseNLP`ChineseNLPLoader`
];
SetDirectory@$HomeDirectory;
