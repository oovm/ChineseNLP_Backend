If[!TrueQ[ChineseNLP`PackageScope`Private`$LoadCompleted],
	<< ChineseNLP`ChineseNLPLoader`
];
Needs["JLink`"]
SetOptions[InstallJava, JVMArguments -> "-Xmx4g"];
SetOptions[ReinstallJava, JVMArguments -> "-Xmx4g"];
ReinstallJava[ClassPath -> "HanLP-1.6.8.jar"]
