(* ::Package:: *)
(* ::Title:: *)
(*信息提取模块(Extract)*)
(* ::Subchapter:: *)
(*程序包介绍*)
(* ::Text:: *)
(*Mathematica Package*)
(*Created by Mathematica Plugin for IntelliJ IDEA*)
(*Establish from GalAster's template(v1.3)*)
(**)
(* ::Text:: *)
(*Author:Aster*)
(*Creation Date:2018-09-03*)
(*Copyright: Mozilla Public License Version 2.0*)
(* ::Program:: *)
(*1.软件产品再发布时包含一份原始许可声明和版权声明。*)
(*2.提供快速的专利授权。*)
(*3.不得使用其原始商标。*)
(*4.如果修改了源代码，包含一份代码修改说明。*)
(**)
(* ::Text:: *)
(*这里应该填这个函数的介绍*)
(* ::Section:: *)
(*函数说明*)
ExtractNewWord::usage = "";
ExtractKeyWord::usage = "";
ExtractSummary::usage = "";
ExtractSummaryList::usage = "";
ExtractPhrase::usage = "";
(* ::Section:: *)
(*程序包正体*)
(* ::Subsection::Closed:: *)
(*主设置*)
Begin["`Extract`"];
(* ::Subsection::Closed:: *)
(*版本信息*)
Version$Extract = "V1.0";
Updated$Extract = "2018-09-06";
(* ::Subsubsection:: *)
(*主体代码*)
Options[ExtractNewWord] = {"Aggregation" -> 100, "Entropy" -> 0.5, "Frequency" -> 0, "Dictionary" -> True};
ExtractNewWord[text_String, num_Integer : 10, len_Integer : 4, OptionsPattern[]] := Block[
	{objs, discover, toString, a, e, f, t},
	{f, e, a, t} = OptionValue[{"Frequency", "Entropy", "Aggregation", "Dictionary"}];
	newWordDiscover = JLink`JavaNew["com.hankcs.hanlp.mining.word.NewWordDiscover", len, f, e, a, t];
	objs = JLink`JavaObjectToExpression@newWordDiscover@discover[text, num];
	Through[objs@toString[]]
];
Options[ExtractKeyWord] := {"Rank" -> False};
textRankKeyword := textRankKeyword = JLink`JavaNew["com.hankcs.hanlp.summary.TextRankKeyword"];
ExtractKeyWord[text_String, num_Integer : 5, OptionsPattern[]] := Block[
	{objs, getTermAndRank, getKeywordList, keySet, values, toArray},
	If[TrueQ@OptionValue["Rank"],
		objs = textRankKeyword@getTermAndRank[text, num];
		AssociationThread[objs@keySet[]@toArray[] -> objs@values[]@toArray[]],
		objs = textRankKeyword@getKeywordList[text, num];
		objs@toArray[]
	]
];
phraseExtractor := phraseExtractor = JLink`JavaNew["com.hankcs.hanlp.mining.phrase.MutualInformationEntropyPhraseExtractor"];
ExtractPhrase[text_String, num_Integer : 5] := Block[
	{objs, extractPhrase, toArray},
	objs = phraseExtractor@extractPhrase[text, num];
	objs@toArray[]
];
textRankSentence := textRankSentence = JLink`JavaNew["com.hankcs.hanlp.summary.TextRankSentence", JLink`JavaNew["java.util.ArrayList"]];
ExtractSummary[text_String, len_Integer : 100] := Block[
	{getSummary},
	textRankSentence@getSummary[text, len]
];
ExtractSummaryList[text_String, num_Integer : 5] := Block[
	{getTopSentenceList, objs, toArray},
	objs = textRankSentence@getTopSentenceList[text, 5];
	objs@toArray[]
];
(* ::Subsection::Closed:: *)
(*附加设置*)
SetAttributes[
	{ExtractNewWord, ExtractKeyWord, ExtractPhrase, ExtractSummary, ExtractSummaryList},
	{Protected, ReadProtected}
];
End[]
