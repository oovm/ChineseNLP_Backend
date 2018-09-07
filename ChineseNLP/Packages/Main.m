ChineseNLP::usage="";
Begin["`Private`"];
PackageLoadPacletDependency["JLink`"];
SetOptions[JLink`InstallJava, JLink`JVMArguments -> "-Xmx2g"];
SetOptions[JLink`ReinstallJava, JLink`JVMArguments -> "-Xmx2g"];
SetDirectory@FileNameJoin[{$UserBaseDirectory, "Applications", "ChineseNLP", "Resources"}];
JLink`ReinstallJava[JLink`ClassPath -> "JLink-ChineseNLP.jar"];
PackageExtendContextPath[
	{
		"JLink`"
	}
];
End[]
