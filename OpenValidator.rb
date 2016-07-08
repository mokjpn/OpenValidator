# -*- coding: utf-8 -*-
require 'rexml/document'
require 'date'
require 'kconv'

puts "Open Validator - PMDA Validation Rule Reject Checker"
puts "Programmed by Osamu Kotera"
puts "Drop Define.xml to this exefile"
puts "or default filename as defne.xml in the same directory"
puts ""
puts "define.xmlをドラッグ＆ドロップすると点検結果を出力します".encode("Windows-31J")
puts 'ダブルクリックした場合、同じフォルダ内の"define.xml"をチェックします'.encode("Windows-31J")
puts 'now checking (takes ca.30sec)'
if ARGV.size > 0 then define = REXML::Document.new(open(ARGV[0]))
else
define = REXML::Document.new(open('define.xml'))
end
#define = REXML::Document.new(open('define2-0-0-example-adam.xml'))

checklist='DD0002-01;Missing or invalid <namespace> namespace reference;/ODM;xmlns;Required;http://www.cdisc.org/ns/odm/v1.3;Define.xml must reference the following namespaces:
DD0002-02;Missing or invalid <namespace> namespace reference;/ODM;xmlns:def;Required;http://www.cdisc.org/ns/def/v2.0;Define.xml must reference the following namespaces:
DD0002-03;Missing or invalid <namespace> namespace reference;/ODM;xmlns:xsi;Conditional Required;http://www.w3.org/2001/XMLSchema-instance;only required when a local schema is provided
DD0002-04;Missing or invalid <namespace> namespace reference;/ODM;xmlns:xlink;Conditional Required;http://www.w3.org/1999/xlink;only required when external documents are provided
DD0003-01;Missing required <attribute> value for <object>;/ODM;xmlns;Required;http://www.cdisc.org/ns/odm/v1.3;Identifies the default namespace for this document.
DD0003-02;Missing required <attribute> value for <object>;/ODM;xmlns:def;Required;http://www.cdisc.org/ns/def/v2.0;XML namespace for Define- XML v2.0.0. While def: is suggested prefix for the Define-XML namespace, it should not be relied upon by the receiving application.
DD0003-03;Missing required <attribute> value for <object>;/ODM;xmlns:xlink;Conditional Required;http://www.w3.org/1999/xlink;XML namespace for XLink. Conditional Required when xlink:href is provided.
DD0003-04;Missing required <attribute> value for <object>;/ODM;xmlns:xsi;Conditional Required;http://www.w3.org/2001/XMLSchema- instance;XML Schema instance namespace. Required when xsi:schemalocation is provided. Conditional Required when xsi:schemalocation is provided.
DD0003-05;Missing required <attribute> value for <object>;/ODM;ODMVersion;Required;2001-03-02;Identifies the ODM version that underlies the schema for the Define-XML document. ODMVersion is optional in the ODM standard, but required in Define-XML.
DD0003-06;Missing required <attribute> value for <object>;/ODM;FileType;Required;Snapshot;Define-XML documents do not include audit trail elements, so the FileType is Snapshot .
DD0003-07;Missing required <attribute> value for <object>;/ODM;FileOID;Required;Text;A unique identifier for this file. See the ODM specification for a discussion of FileOID recommendations.
DD0003-08;Missing required <attribute> value for <object>;/ODM;CreationDateTi me;Required;ISO8601 datetime Sample: 2010-09-30T15:31:04;The date and time when the specific version of the define.xml file was created. This can be more accurately thought of as the last modified date and time.
DD0003-09;Missing required <attribute> value for <object>;/ODM/Study;StudyOID;Required;Text;The unique ID of the Study. See the ODM specification section 2.11 for OID considerations.
DD0003-10;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion;OID;Required;Text;Unique ID for the MetaDataVersion. See the ODM specification section 2.11 for OID considerations.
DD0003-11;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion;Name;Required;Text;Name for the MetaDataVersion.
DD0003-12;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion;def:DefineVersion;Required;2.0.0;Version of Define-XML that the file conforms to.
DD0003-13;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion;def:StandardName;Required;Text Allowable Values (Extensible):SDTM-IG ADaM-IG SEND-IG;Name of an external standard to which the data conforms.
DD0003-14;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion;def:StandardVersion;Required;Text;Version of an external standard to which the data conforms. See Section 1.5 for a list of the versions of CDISC Standards supported by Define- XML v2.0.0 (e.g. 3.1.2 for SDTM-IG).
DD0003-15;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/def:AnnotatedCRF/def:DocumentRef ;leafID;Required;Text;Reference to the unique ID of the def:leaf element that contains the location of a PDF file.
DD0003-16;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/def:SupplementalDoc/def:DocumentRef ;leafID;Required;Text;Reference to the unique ID of the def:leaf element that contains the location of a PDF file.
DD0003-17;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemDef/def:Origin/def:DocumentRef ;leafID;Required;Text;Reference to the unique ID of the def:leaf element that contains the location of a PDF file.
DD0003-18;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/MethodDef/def:DocumentRef ;leafID;Required;Text;Reference to the unique ID of the def:leaf element that contains the location of a PDF file.
DD0003-19;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/def:CommentDef/def:DocumentRef;leafID;Required;Text;Reference to the unique ID of the def:leaf element that contains the location of a PDF file.
DD0003-20;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemDef/def:Origin/def:DocumentRef/def:PDFPageRef ;Type;Required;PhysicalRef NamedDestination;Type of page for page references indicated in the PageRefs attribute. Business Rule: When Type=NamedDestination, NamedDestinations have to be created within the PDF document to be able to link to them with a hyperlink.
DD0003-21;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/MethodDef/def:DocumentRef/def:PDFPageRef ;Type;Required;PhysicalRef NamedDestination;Type of page for page references indicated in the PageRefs attribute. Business Rule: When Type=NamedDestination, NamedDestinations have to be created within the PDF document to be able to link to them with a hyperlink.
DD0003-22;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/def:CommentDef/def:DocumentRef/def:PDFPageRef;Type;Required;PhysicalRef NamedDestination;Type of page for page references indicated in the PageRefs attribute. Business Rule: When Type=NamedDestination, NamedDestinations have to be created within the PDF document to be able to link to them with a hyperlink.
DD0003-23;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemDef/def:Origin/def:DocumentRef/def:PDFPageRef ;FirstPage;Conditional Required;Integer;First page in a range of pages. Note that the way to indicate the range of pages depends on the associated Type attribute provided. Conditional Required if PageRefs is not provided
DD0003-24;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/MethodDef/def:DocumentRef/def:PDFPageRef ;FirstPage;Conditional Required;Integer;First page in a range of pages. Note that the way to indicate the range of pages depends on the associated Type attribute provided. Conditional Required if PageRefs is not provided
DD0003-25;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/def:CommentDef/def:DocumentRef/def:PDFPageRef;FirstPage;Conditional Required;Integer;First page in a range of pages. Note that the way to indicate the range of pages depends on the associated Type attribute provided. Conditional Required if PageRefs is not provided
DD0003-26;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemDef/def:Origin/def:DocumentRef/def:PDFPageRef ;LastPage;Conditional Required;Integer;Last page in a range of pages. Note that the way to indicate the range of pages depends on the associated Type attribute provided. Conditional Required if PageRefs is not provided
DD0003-27;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/MethodDef/def:DocumentRef/def:PDFPageRef ;LastPage;Conditional Required;Integer;Last page in a range of pages. Note that the way to indicate the range of pages depends on the associated Type attribute provided. Conditional Required if PageRefs is not provided
DD0003-28;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/def:CommentDef/def:DocumentRef/def:PDFPageRef;LastPage;Conditional Required;Integer;Last page in a range of pages. Note that the way to indicate the range of pages depends on the associated Type attribute provided. Conditional Required if PageRefs is not provided
DD0003-29;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/def:ValueListDef;OID;Required;Text;Unique ID for the Value List. See the ODM specification section 2.11 for OID considerations.
DD0003-30;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemGroupDef/ItemRef ;ItemOID;Required;Text;Reference to the unique ID of an ItemDef element. See the ODM specification section 2.11 for OID considerations. Business Rule: Each ItemOID used in an ItemRef must match an OID for an ItemDef.
DD0003-31;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/def:ValueListDef/ItemRef;ItemOID;Required;Text;Reference to the unique ID of an ItemDef element. See the ODM specification section 2.11 for OID considerations. Business Rule: Each ItemOID used in an ItemRef must match an OID for an ItemDef.
DD0003-32;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemGroupDef/ItemRef ;Mandatory;Required;Allowable Values: Yes No;Business Rules: For SDTM based variables where Core is Req (Required), the value of Mandatory should be set to Yes For variables where Core is Exp (Expected) or perm (Permissible) and the sponsor does not require a more restrictive condition, Mandatory should be set to No. Variables where Mandatory=Yes must not have a null value.
DD0003-33;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/def:ValueListDef/ItemRef;Mandatory;Required;Allowable Values: Yes No;Business Rules: For SDTM based variables where Core is Req (Required), the value of Mandatory should be set to Yes For variables where Core is Exp (Expected) or perm (Permissible) and the sponsor does not require a more restrictive condition, Mandatory should be set to No. Variables where Mandatory=Yes must not have a null value.
DD0003-34;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemGroupDef/ItemRef ;KeySequence;Conditional Required;Integer;The KeySequence indicates that this item is a key for the enclosing item group. It also provides an ordering for the keys. Conditional Required for Regulatory Submissions
DD0003-35;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/def:ValueListDef/ItemRef;KeySequence;Conditional Required;Integer;The KeySequence indicates that this item is a key for the enclosing item group. It also provides an ordering for the keys. Conditional Required for Regulatory Submissions
DD0003-36;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemGroupDef/ItemRef ;MethodOID;Conditional Required;Text;Reference to the unique ID of a MethodDef element. Conditional This attribute and the associated MethodDef are Required when the Type attribute for the def:Origin child element of the referenced ItemDef is Derived. Otherwise, this attribute is Optional.
DD0003-37;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/def:ValueListDef/ItemRef;MethodOID;Conditional Required;Text;Reference to the unique ID of a MethodDef element. Conditional This attribute and the associated MethodDef are Required when the Type attribute for the def:Origin child element of the referenced ItemDef is Derived. Otherwise, this attribute is Optional.
DD0003-38;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemGroupDef/ItemRef ;Role;Conditional Required;Text Allowable Values: If SDTM or SEND datasets, any valid SDTM or SEND role as defined in the corresponding IG. For other datasets any value can be used.;Variable Role defines how the variable defined by the corresponding ItemDef element is used within the dataset. Note that Role is not defined for ADaM variables or parameters at the present time. Optional for SDTM standard domains. The values provided by the SDTM or SEND IGs are used for the standard domains. Conditional required for SDTM custom domains Not applicable for ADaM.
DD0003-39;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/def:ValueListDef/ItemRef;Role;Conditional Required;Text Allowable Values: If SDTM or SEND datasets, any valid SDTM or SEND role as defined in the corresponding IG. For other datasets any value can be used.;Variable Role defines how the variable defined by the corresponding ItemDef element is used within the dataset. Note that Role is not defined for ADaM variables or parameters at the present time. Optional for SDTM standard domains. The values provided by the SDTM or SEND IGs are used for the standard domains. Conditional required for SDTM custom domains Not applicable for ADaM.
DD0003-40;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/def:ValueListDef /ItemRef/def:WhereClauseRef;WhereClauseOID;Required;Text;Reference to the unique ID of a def:WhereClauseDef element.
DD0003-41;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/def:WhereClauseDef;OID;Required;Text;Unique ID for the WhereClauseDef. See the ODM specification section 2.11 for OID considerations.
DD0003-42;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/def:WhereClauseDef;def:CommentOID;Conditional Required;Text;Reference to the unique ID of a def:CommentDef that describes how to join the datasets when the WhereClause includes references to variables in different datasetst. Conditional Required when RangeCheck includes def:ItemOID values that belong to different ItemGroupDef elements
DD0003-43;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/def:WhereClauseDef/RangeCheck;Comparator;Required;Allowable Values: LT LE GT GE EQ NE IN NOTIN;Comparison operator for Where Clause.
DD0003-44;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/def:WhereClauseDef/RangeCheck;SoftHard;Required;Allowable Values: Soft Hard;If an actual data value fails the constraint, it is either rejected (a Hard constraint) or a warning is produced (a Soft constraint). Business Rule: The SoftHard attribute has no meaning in the Define-XML context. Although ODM requires a value equal to Hard or Soft, neither value implies any meaning to the enclosing RangeCheck or WhereClauseDef element.
DD0003-45;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/def:WhereClauseDef/RangeCheck;def:ItemOID;Required;Text;Reference to the unique ID of an ItemDef that is used to compare with the CheckValue.
DD0003-46;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemGroupDef;OID;Required;Text;Unique ID for the ItemGroupDef (dataset). See the ODM specification section 2.11 for OID considerations.
DD0003-47;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemGroupDef;Name;Required;Text;Short description for the ItemGroup. Note that the Name attribute must be the same as SASDatasetName if SAS is being used as a transport mechanism. If the transport mechanism is not SAS based this attribute will contain the name of the domain.
DD0003-48;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemGroupDef;Domain;Conditional Required;Text;Domain as specified by the SDTM Metadata Submission Guidelines. For split domains, Domain must contain the root Domain name. Conditional Required in the context of a regulatory submission in Define- XML for SDTM and SEND Not applicable for ADaM
DD0003-49;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemGroupDef;SASDatasetName;Conditional Required;Text;Root name of SAS dataset contained in the SAS Transport file containing the ItemGroup data. This is the same as the file name but without the .xpt extension. Business Rules Must conform to SAS Transport file naming rules. If a value is provided it should be the same as the Domain name specified in the Name attribute above, except for split datasets. In the case of split datasets, the value of the SASDatasetName attribute and the file name referenced by the def:ArchiveLocationID attribute will contain a suffix component to identify the individual split file: i.e, QSCG, QSCS, etc. Conditional Required in the context of a regulatory submission in Define- XML
DD0003-50;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemGroupDef;Repeating;Required;Allowable Values: Yes No;Indicates whether a domain contains more than one record per subject or only one record per subject. Business Rules: Set Repeating=No when used in the reference data section
DD0003-51;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemGroupDef;Purpose;Required;Allowable Values: Tabulation, Analysis.;Purpose of domain or dataset. Business Rules: For SDTM and SEND use Tabulation For ADaM use Analysis
DD0003-52;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemGroupDef;def:Structure;Required;Text Samples: MH domain: One record per medical history event per subject VS domain: One record per vital sign measurement per visit per subject ADQSADAS dataset: One record per subject per parameter per analysis visit per analysis date;Description of the level of detail represented by individual records in the dataset.
DD0003-53;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemGroupDef;Def:Class;Conditional Required;Text Allowable Values: CDISC Submission Value (=CodedValue) as listed in the NCI/CDISC Controlled Terminology, CodeList GNRLOBSC - General Observation Class, NCI Code C103329 SDTM and SEND: SPECIAL PURPOSE FINDINGS EVENTS INTERVENTIONS TRIAL DESIGN RELATIONSHIP ADaM: SUBJECT LEVEL ANALYSIS DATASET BASIC DATA STRUCTURE ADAM OTHER;General class of the data domain. Notes: - The allowable values are case sensitive and must be used as specified. - The CodeList is not extensible. Conditional Required in the context of a regulatory submission in Define- XML
DD0003-54;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemGroupDef;def:ArchiveLocatio nID;Conditional Required;Text;Reference to the unique ID of a def:leaf that provides the actual location and file name of the SAS transport file. If provided, it should match the leaf:id attribute of the def:leaf child element. If not provided, the root dataset file name is expected to be the same as the Name attribute. Conditional Required in the context of a regulatory submission in Define- XML
DD0003-55;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemGroupDef/Alias ;Context;Required;Text Allowable Values: As a child element of an ItemGroupDef element: DomainDescription As a child element of a CodeList, CodeListItem or EnumeratedItem element: nci:ExtCodeID;Indicates the context or setting where the Alias Name attribute applies.
DD0003-56;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/CodeList/Alias ;Context;Required;Text Allowable Values: As a child element of an ItemGroupDef element: DomainDescription As a child element of a CodeList, CodeListItem or EnumeratedItem element: nci:ExtCodeID;Indicates the context or setting where the Alias Name attribute applies.
DD0003-57;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/CodeList/CodeListItem/Alias ;Context;Required;Text Allowable Values: As a child element of an ItemGroupDef element: DomainDescription As a child element of a CodeList, CodeListItem or EnumeratedItem element: nci:ExtCodeID;Indicates the context or setting where the Alias Name attribute applies.
DD0003-58;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/CodeList/EnumeratedItem/Alias;Context;Required;Text Allowable Values: As a child element of an ItemGroupDef element: DomainDescription As a child element of a CodeList, CodeListItem or EnumeratedItem element: nci:ExtCodeID;Indicates the context or setting where the Alias Name attribute applies.
DD0003-59;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemGroupDef/Alias ;Name;Required;Text Allowable Values: As a child element of an ItemGroupDef element: DomainDescription As a child element of a CodeList, CodeListItem or EnumeratedItem element: nci:ExtCodeID;Alternative Name for parent element.
DD0003-60;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/CodeList/Alias ;Name;Required;Text Allowable Values: As a child element of an ItemGroupDef element: DomainDescription As a child element of a CodeList, CodeListItem or EnumeratedItem element: nci:ExtCodeID;Alternative Name for parent element.
DD0003-61;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/CodeList/CodeListItem/Alias ;Name;Required;Text Allowable Values: As a child element of an ItemGroupDef element: DomainDescription As a child element of a CodeList, CodeListItem or EnumeratedItem element: nci:ExtCodeID;Alternative Name for parent element.
DD0003-62;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/CodeList/EnumeratedItem/Alias;Name;Required;Text Allowable Values: As a child element of an ItemGroupDef element: DomainDescription As a child element of a CodeList, CodeListItem or EnumeratedItem element: nci:ExtCodeID;Alternative Name for parent element.
DD0003-63;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemDef;OID;Required;Text;Unique ID for the ItemDef (variable/value). See the ODM specification section 2.11 for OID considerations.
DD0003-64;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemDef;Name;Required;Text;Dataset Variable name or Variable Value Name.
DD0003-65;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemDef;DataType;Required;Allowable Values: Refer to Section 4.2.1 for a list of the valid Define-XML DataType values. Samples: For SDTM, SEND and ADaM variables one of (text, float, integer, date, datetime).;The data type of the variable or value.
DD0003-66;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemDef;Length;Conditional Required;Integer;The variable length. Business Rule: Length should be defined as the maximum expected variable length. Should only be present for DataType equal to text, integer, or float. Conditional Required if DataType is text, integer, or float.
DD0003-67;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemDef;SignificantDigits;Conditional Required;Integer;The number of digits following the decimal point in a floating point number. Business Rule: When DataType is float both Length and SignificantDigits must be provided. Conditional Required if DataType is float.
DD0003-68;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemDef;SASFieldName;Conditional Required;Text;SAS Variable Name. Business Rule: Follow rules for Variable names in SAS Transport files. Conditional Required in the context of a regulatory submission in Define-XML
DD0003-69;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemDef/CodeListRef;CodeListOID;Required;Text;Reference to the unique ID of a CodeList element that defines Controlled Terminology for the variable or values defined by the ItemDef. See the ODM specification section 2.11 for OID considerations. Business Rule: Must match the OID of a CodeList element in the same MetaDataVersion.
DD0003-70;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemDef/def:ValueListRef;ValueListOID;Required;Text;Reference to the unique ID of a def:ValueListDef element that provides value level metadata. See the ODM specification section 2.11 for OID considerations. Business Rule: Must match the OID of a def:ValueListDef in the same MetaDataVersion.
DD0003-71;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemDef/def:Origin;Type;Required;Value Description: Origin or data source type. Allowable Values: CRF: Data that was collected as part of a CRF and has an annotated CRF associated with the variable. Derived: Data that is not directly collected on the CRF or received via eDT, but is calculated by an algorithm or reproducible rule defined by the sponsor, which is dependent upon other data values. Assigned: Data that is determined by individual judgment (by an evaluator other than the subject or investigator), rather than collected as part of the CRF, eDT or derived based on an algorithm. This may include third party attributions by an adjudicator. Coded terms that are supplied as part of a coding process (as in --DECOD) are considered to have an Origin of Assigned. Values that are set independently of any subject-related data values in order to complete SDTM fields such as DOMAIN and - -TESTCD are considered to have an Origin of Assigned. Protocol: Data that is defined as part of the Trial Design preparation. An example would be VSPOS (Vital Signs Position), which may be specified only in the protocol and not appear on a CRF or transferred via eDT. eDT: Data that is received via an electronic Data Transfer (eDT) and usually does not have associated annotations. An origin of eDT refers to data collected via data streams such as laboratory, ECG, or IVRS. Predecessor: Data that is copied from a variable in another dataset. For example, predecessor is used to link ADaM data back to SDTM variables to establish traceability.;Business Rule: If the variable is derived, a MethodDef must be provided. The list of allowable values is not extensible.
DD0003-72;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/CodeList;OID;Required;Text;Unique ID for the CodeList. See the ODM specification section 2.11 for OID considerations.
DD0003-73;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/CodeList;Name;Required;Text;Controlled Terminology name. Business Rule: For NCI/CDISC Controlled Terminology, this must exactly match the CodeList Name from the published Controlled Terminology ODM.
DD0003-74;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/CodeList;DataType;Required;Allowable Values: text float integer;The data type of the codes.
DD0003-75;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/CodeList/EnumeratedItem;CodedValue;Required;Text;The coded value. Business Rule: For NCI/CDISC Controlled Terminology, this must exactly match the CodedValue from the published Controlled Terminology ODM.
DD0003-76;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/CodeList/EnumeratedItem;def:ExtendedValue;Conditional Required;Allowable Value: Yes;Indicates a coded value that has been used by the sponsor to extend external controlled terminology Note that Controlled Terminologies should only be extended by the sponsor in case the Controlled Terminology allows extension, and only in the case where there is no equivalent value or synonym already in the CodeList. Note that the attribute should be omitted when the CodedValue is not an extended value since the only allowable value is Yes. Conditional Required when the CodedValue is an extended value.
DD0003-77;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/CodeList/CodeListItem;CodedValue;Required;Text;The coded value. Business Rule: For NCI/CDISC Controlled Terminology, this must exactly match the CodedValue from the published Controlled Terminology ODM.
DD0003-78;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/CodeList/CodeListItem;def:ExtendedValue;Conditional Required;Allowable Value: Yes;Indicates a coded value that has been used by the sponsor to extend external controlled terminology Note that Controlled Terminologies should only be extended by the sponsor in case the Controlled Terminology allows extension, and only in the case where there is no equivalent value or synonym already in the CodeList. Note that the attribute should be omitted when the CodedValue is not an extended value since the only allowable value is Yes. Conditional Required when the CodedValue is an extended value.
DD0003-79;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/CodeList/ExternalCodeList;Dictionary;Required;Text;The name of the external codelist.
DD0003-80;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/CodeList/ExternalCodeList;Version;Required;Text;The version designator of the external codelist.
DD0003-81;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/MethodDef;OID;Required;Text;Unique ID for the MethodDef. See the ODM specification section 2.11 for OID considerations.
DD0003-82;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/MethodDef;Name;Required;Text;The Method name.
DD0003-83;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/MethodDef;Type;Required;Allowable Values: Computation Imputation;The Method type. A Computation uses an algorithm to derive a value. An Imputation is the process of replacing missing data with substitute values.
DD0003-84;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/MethodDef/FormalExpression;Context;Required;Text;A free-form qualifier to suggest an appropriate computer language to be used when evaluating the FormalExpression content.
DD0003-85;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/def:CommentDef;OID;Required;Text;Unique ID for the CommentDef. See the ODM specification section 2.11 for OID considerations.
DD0003-86;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/def:leaf ;ID;Required;Since the leaf ID is based on the XML xs:ID datatype, the allowed characters for the ID attribute are letters, digits, period, colons and hyphens.;Unique ID for the def:leaf. See the ODM specification section 2.11 for OID considerations. Business Rules: The def:leaf ID attributes must be unique within the define.xml document, i.e. there can be no 2 def:leaf elements with the same ID attribute.
DD0003-87;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemGroupDef/def:leaf;ID;Required;Since the leaf ID is based on the XML xs:ID datatype, the allowed characters for the ID attribute are letters, digits, period, colons and hyphens.;Unique ID for the def:leaf. See the ODM specification section 2.11 for OID considerations. Business Rules: The def:leaf ID attributes must be unique within the define.xml document, i.e. there can be no 2 def:leaf elements with the same ID attribute.
DD0003-88;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/def:leaf ;Xlink:href;Required;Text;URL that can be used to identify the location of a document or dataset file relative to the folder containing the Define-XML file. If the file is not located in the Define-XML folder, a relative file path should be included. Business Rules: Currently, when referenced by def:ArchiveLocationID in the context of a regulatory submission not in ODM XML, it should be the pathname and filename of the SAS Transport file, including the .xpt extension, relative to the define.xml file. The value is used by the standard XSL stylesheet to provide a link to the corresponding SAS Transport file. For regulatory submissions to the FDA, the locations specified have to conform to locations allowed in the eCTD and the Study Data Specifications. See section 2.2 References.
DD0003-89;Missing required <attribute> value for <object>;/ODM/Study/MetaDataVersion/ItemGroupDef/def:leaf;Xlink:href;Required;Text;URL that can be used to identify the location of a document or dataset file relative to the folder containing the Define-XML file. If the file is not located in the Define-XML folder, a relative file path should be included. Business Rules: Currently, when referenced by def:ArchiveLocationID in the context of a regulatory submission not in ODM XML, it should be the pathname and filename of the SAS Transport file, including the .xpt extension, relative to the define.xml file. The value is used by the standard XSL stylesheet to provide a link to the corresponding SAS Transport file. For regulatory submissions to the FDA, the locations specified have to conform to locations allowed in the eCTD and the Study Data Specifications. See section 2.2 References.
DD0006-01;Missing required <element> value;/ODM;;Required;ODM;Requirement: Required Cardinality: Exactly one Other Information: This is the root element for the define.xml document
DD0006-02;Missing required <element> value;/ODM/Study;;Required;Study;Requirement: Required Cardinality: Exactly One Other Information: The child element GlobalVariables contains child elements that capture high level study information. The child element MetaDataVersion includes child elements to describe a collection of Datasets.
DD0006-03;Missing required <element> value;/ODM/Study/GlobalVariables;;Required;GlobalVariables;Requirement: Required Cardinality: Exactly One Other Information: High level study information.
DD0006-04;Missing required <element> value;/ODM/Study/GlobalVariables/StudyName;;Required;StudyName;The short, external name assigned to the Study Requirement: Required Cardinality: Exactly One
DD0006-05;Missing required <element> value;/ODM/Study/GlobalVariables/StudyDescription;;Required;StudyDescription;A text description of the contents of the Study. Requirement: Required Cardinality: Exactly One Other Information: Usually found in the high level description of the study the Protocol document.
DD0006-06;Missing required <element> value;/ODM/Study/GlobalVariables/ProtocolName;;Required;ProtocolName;The sponsor’s internal name assigned to the Study Requirement: Required Cardinality: Exactly One Other Information: Usually found in the high level description of the study in the Protocol document.
DD0006-07;Missing required <element> value;/ODM/Study/MetaDataVersion;;Required;MetaDataVersion;Requirement: Required Cardinality: One
DD0006-08;Missing required <element> value;/ODM/Study/MetaDataVersion/def:AnnotatedCRF;;Optional;def:AnnotatedCRF;Requirement: Optional Cardinality: Zero or One Other Information: Contains the DocumentRef for the Annotated CRF.
DD0006-09;Missing required <element> value;/ODM/Study/MetaDataVersion/def:AnnotatedCRF/def:DocumentRef;;Conditional Required;def:DocumentRef;Requirement: Conditional Required for def:AnnotatedCRF and def:SupplementalDoc Optional for def:Origin, MethodDef and def:CommentDef Cardinality: One or More Business Rule: If multiple documents are provided there will be multiple def:DocumentRef child elements within the def:SupplementalDoc element.
DD0006-10;Missing required <element> value;/ODM/Study/MetaDataVersion/def:SupplementalDoc/def:DocumentRef;;Conditional Required;def:DocumentRef;Requirement: Conditional Required for def:AnnotatedCRF and def:SupplementalDoc Optional for def:Origin, MethodDef and def:CommentDef Cardinality: One or More Business Rule: If multiple documents are provided there will be multiple def:DocumentRef child elements within the def:SupplementalDoc element.
DD0006-11;Missing required <element> value;/ODM/Study/MetaDataVersion/ItemDef/def:Origin/def:DocumentRef;;Conditional Required;def:DocumentRef;Requirement: Conditional Required for def:AnnotatedCRF and def:SupplementalDoc Optional for def:Origin, MethodDef and def:CommentDef Cardinality: One or More Business Rule: If multiple documents are provided there will be multiple def:DocumentRef child elements within the def:SupplementalDoc element.
DD0006-12;Missing required <element> value;/ODM/Study/MetaDataVersion/MethodDef/def:DocumentRef;;Conditional Required;def:DocumentRef;Requirement: Conditional Required for def:AnnotatedCRF and def:SupplementalDoc Optional for def:Origin, MethodDef and def:CommentDef Cardinality: One or More Business Rule: If multiple documents are provided there will be multiple def:DocumentRef child elements within the def:SupplementalDoc element.
DD0006-13;Missing required <element> value;/ODM/Study/MetaDataVersion/def:CommentDef/def:DocumentRef;;Conditional Required;def:DocumentRef;Requirement: Conditional Required for def:AnnotatedCRF and def:SupplementalDoc Optional for def:Origin, MethodDef and def:CommentDef Cardinality: One or More Business Rule: If multiple documents are provided there will be multiple def:DocumentRef child elements within the def:SupplementalDoc element.
DD0006-14;Missing required <element> value;/ODM/Study/MetaDataVersion/ItemDef/def:Origin/def:DocumentRef/def:PDFPageRef;;Conditional Required;def:PDFPageRef;Requirement: Conditional Required for def:Origin/@Type=CRF Optional in all other cases Cardinality: Zero or more.
DD0006-15;Missing required <element> value;/ODM/Study/MetaDataVersion/MethodDef/def:DocumentRef/def:PDFPageRef;;Conditional Required;def:PDFPageRef;Requirement: Conditional Required for def:Origin/@Type=CRF Optional in all other cases Cardinality: Zero or more.
DD0006-16;Missing required <element> value;/ODM/Study/MetaDataVersion/def:CommentDef/def:DocumentRef/def:PDFPageRef;;Conditional Required;def:PDFPageRef;Requirement: Conditional Required for def:Origin/@Type=CRF Optional in all other cases Cardinality: Zero or more.
DD0006-17;Missing required <element> value;/ODM/Study/MetaDataVersion/def:SupplementalDoc;;Optional;def:SupplementalDoc;Requirement: Optional Cardinality: Zero or One Business Rule: If multiple documents are provided there will be multiple def:DocumentRef child elements within the def:SupplementalDoc element.
DD0006-18;Missing required <element> value;/ODM/Study/MetaDataVersion/def:ValueListDef;;Conditional Required;def:ValueListDef;Requirement: Conditional Cardinality: Required for each unique value of the ValueListOID attribute within the MetaDataVersion. Business Rule: A def:ValueListDef element to describe the variable QNAM must be included for each ItemGroupDef element that has def:Class=RELATIONSHIP. Other Information: it is the container for child ItemRef elements that link to ItemDef elements for a complete definition of a Value-Level Variable.
DD0006-19;Missing required <element> value;/ODM/Study/MetaDataVersion/ItemGroupDef/ItemRef ;;Required;Description;Requirement: Required Cardinality: One for each dataset variable (when parent node is an ItemGroupDef element) One for each Value to be defined (when parent node is a ValueListDef element).
DD0006-20;Missing required <element> value;/ODM/Study/MetaDataVersion/def:ValueListDef/ItemRef;;Required;Description;Requirement: Required Cardinality: One for each dataset variable (when parent node is an ItemGroupDef element) One for each Value to be defined (when parent node is a ValueListDef element).
DD0006-21;Missing required <element> value;/ODM/Study/MetaDataVersion/def:ValueListDef /ItemRef/def:WhereClauseRef;;Conditional Required;def:WhereClauseRef;Requirement: Conditional Cardinality: One or more def:WhereClauseRef elements is Required for each ItemRef child element within a def:ValueListDef Business Rule: Not allowed as a child element of an ItemRef element if the parent node is a def:ItemGroupDef element. It will be considered non-conforming
DD0006-22;Missing required <element> value;/ODM/Study/MetaDataVersion/def:WhereClauseDef;;Conditional Required;def:WhereClauseDef;Requirement: Conditional Cardinality: A def:WhereClause is required for each unique value of the WhereClauseOID attribute value in a def:WhereClauseRef element within the MetaDataVersion.
DD0006-23;Missing required <element> value;/ODM/Study/MetaDataVersion/def:WhereClauseDef/RangeCheck;;Required;RangeCheck;Contains the comparison specification defining the Where Clause condition. Requirement: Required Cardinality: Each def:WhereClauseDef element must have at least one RangeCheck child element. Other Information: If multiple RangeChecks are given the condition is the logical AND of all the RangeChecks.
DD0006-24;Missing required <element> value;/ODM/Study/MetaDataVersion/def:WhereClauseDef/RangeCheck;;Required;RangeCheck;The comparison value Requirement: Required Cardinality: One
DD0006-25;Missing required <element> value;/ODM/Study/MetaDataVersion/ItemGroupDef;;Required;ItemGroupDef;Requirement: Required Cardinality: One or more Business Rule: The Implementation Guides for each relevant standard specify the datasets required for FDA submissions.
DD0006-26;Missing required <element> value;/ODM/Study/MetaDataVersion/ItemGroupDef/Description;;Conditional Required;Description;Requirement: Conditional Required for regulatory submissions or any case where the Define-XML will be checked for compliance with a standard that requires a dataset label. Required for MethodDef/Description and def:CommentDef/Description Optional for ItemDef/Description corresponding to Value Level definitions or for def:Origin/Description. Cardinality: Zero or One Business Rules: For SDTM or SEND standard domains or for ADaM standard datasets, the ItemGroupDef/Description and ItemDef/Description should exactly match the label for the relevant standard dataset or variable. For custom domains or datasets, sponsors should provide a short description of the type of data contained within the dataset or variable in ItemGroupDef/Description and ItemDef/Description. def:Origin/Description must be provided to indicate the source when def:Origin@Type=Predecessor. Conventions described in IG documents for the specific standard should be followed.
DD0006-27;Missing required <element> value;/ODM/Study/MetaDataVersion/ItemDef/Description;;Conditional Required;Description;Requirement: Conditional Required for regulatory submissions or any case where the Define-XML will be checked for compliance with a standard that requires a dataset label. Required for MethodDef/Description and def:CommentDef/Description Optional for ItemDef/Description corresponding to Value Level definitions or for def:Origin/Description. Cardinality: Zero or One Business Rules: For SDTM or SEND standard domains or for ADaM standard datasets, the ItemGroupDef/Description and ItemDef/Description should exactly match the label for the relevant standard dataset or variable. For custom domains or datasets, sponsors should provide a short description of the type of data contained within the dataset or variable in ItemGroupDef/Description and ItemDef/Description. def:Origin/Description must be provided to indicate the source when def:Origin@Type=Predecessor. Conventions described in IG documents for the specific standard should be followed.
DD0006-28;Missing required <element> value;/ODM/Study/MetaDataVersion/ItemDef/def:Origin/Description;;Conditional Required;Description;Requirement: Conditional Required for regulatory submissions or any case where the Define-XML will be checked for compliance with a standard that requires a dataset label. Required for MethodDef/Description and def:CommentDef/Description Optional for ItemDef/Description corresponding to Value Level definitions or for def:Origin/Description. Cardinality: Zero or One Business Rules: For SDTM or SEND standard domains or for ADaM standard datasets, the ItemGroupDef/Description and ItemDef/Description should exactly match the label for the relevant standard dataset or variable. For custom domains or datasets, sponsors should provide a short description of the type of data contained within the dataset or variable in ItemGroupDef/Description and ItemDef/Description. def:Origin/Description must be provided to indicate the source when def:Origin@Type=Predecessor. Conventions described in IG documents for the specific standard should be followed.
DD0006-29;Missing required <element> value;/ODM/Study/MetaDataVersion/MethodDef/Description;;Conditional Required;Description;Requirement: Conditional Required for regulatory submissions or any case where the Define-XML will be checked for compliance with a standard that requires a dataset label. Required for MethodDef/Description and def:CommentDef/Description Optional for ItemDef/Description corresponding to Value Level definitions or for def:Origin/Description. Cardinality: Zero or One Business Rules: For SDTM or SEND standard domains or for ADaM standard datasets, the ItemGroupDef/Description and ItemDef/Description should exactly match the label for the relevant standard dataset or variable. For custom domains or datasets, sponsors should provide a short description of the type of data contained within the dataset or variable in ItemGroupDef/Description and ItemDef/Description. def:Origin/Description must be provided to indicate the source when def:Origin@Type=Predecessor. Conventions described in IG documents for the specific standard should be followed.
DD0006-30;Missing required <element> value;/ODM/Study/MetaDataVersion/def:CommentDef/Description;;Conditional Required;Description;Requirement: Conditional Required for regulatory submissions or any case where the Define-XML will be checked for compliance with a standard that requires a dataset label. Required for MethodDef/Description and def:CommentDef/Description Optional for ItemDef/Description corresponding to Value Level definitions or for def:Origin/Description. Cardinality: Zero or One Business Rules: For SDTM or SEND standard domains or for ADaM standard datasets, the ItemGroupDef/Description and ItemDef/Description should exactly match the label for the relevant standard dataset or variable. For custom domains or datasets, sponsors should provide a short description of the type of data contained within the dataset or variable in ItemGroupDef/Description and ItemDef/Description. def:Origin/Description must be provided to indicate the source when def:Origin@Type=Predecessor. Conventions described in IG documents for the specific standard should be followed.
DD0006-31;Missing required <element> value;/ODM/Study/MetaDataVersion/ItemGroupDef/Description/TranslatedText;;Required;TranslatedText;text string Requirement: Required Cardinality: One or more. Multiple TranslatedText child elements can be used to provide the dataset description in different languages. One for each language the description is desired. Business Rules: A child TranslatedText element in English (without attribute xml:lang or xml:lang=en) is required when files are submitted to the FDA. In cases where SAS Transport files are the transport format, the value provided in the ItemGroupDef element should match the dataset label provided in the SAS Transport file.
DD0006-32;Missing required <element> value;/ODM/Study/MetaDataVersion/ItemDef/Description/TranslatedText;;Required;TranslatedText;text string Requirement: Required Cardinality: One or more. Multiple TranslatedText child elements can be used to provide the dataset description in different languages. One for each language the description is desired. Business Rules: A child TranslatedText element in English (without attribute xml:lang or xml:lang=en) is required when files are submitted to the FDA. In cases where SAS Transport files are the transport format, the value provided in the ItemGroupDef element should match the dataset label provided in the SAS Transport file.
DD0006-33;Missing required <element> value;/ODM/Study/MetaDataVersion/CodeList/CodeListItem/Decode/TranslatedText;;Required;TranslatedText;text string Requirement: Required Cardinality: One or more. Multiple TranslatedText child elements can be used to provide the dataset description in different languages. One for each language the description is desired. Business Rules: A child TranslatedText element in English (without attribute xml:lang or xml:lang=en) is required when files are submitted to the FDA. In cases where SAS Transport files are the transport format, the value provided in the ItemGroupDef element should match the dataset label provided in the SAS Transport file.
DD0006-34;Missing required <element> value;/ODM/Study/MetaDataVersion/MethodDef/Description/TranslatedText;;Required;TranslatedText;text string Requirement: Required Cardinality: One or more. Multiple TranslatedText child elements can be used to provide the dataset description in different languages. One for each language the description is desired. Business Rules: A child TranslatedText element in English (without attribute xml:lang or xml:lang=en) is required when files are submitted to the FDA. In cases where SAS Transport files are the transport format, the value provided in the ItemGroupDef element should match the dataset label provided in the SAS Transport file.
DD0006-35;Missing required <element> value;/ODM/Study/MetaDataVersion/def:CommentDef/Description/TranslatedText;;Required;TranslatedText;text string Requirement: Required Cardinality: One or more. Multiple TranslatedText child elements can be used to provide the dataset description in different languages. One for each language the description is desired. Business Rules: A child TranslatedText element in English (without attribute xml:lang or xml:lang=en) is required when files are submitted to the FDA. In cases where SAS Transport files are the transport format, the value provided in the ItemGroupDef element should match the dataset label provided in the SAS Transport file.
DD0006-36;Missing required <element> value;/ODM/Study/MetaDataVersion/ItemGroupDef/Alias;;Conditional Required;Alias;Requirement: Conditional Cardinality: One or more When used for regulatory submission, the Alias element is required for each ItemGroup that is part of a Domain that has been split into different datasets. When used for regulatory submission of SDTM, ADaM or SEND metadata, the Alias element is required for each CodeList that represents a CDISC Controlled Terminology and for each EnumeratedITem of CodeListItem element that represents a CDISC defined term in a CDISC Controlled Terminology.
DD0006-37;Missing required <element> value;/ODM/Study/MetaDataVersion/CodeList/Alias;;Conditional Required;Alias;Requirement: Conditional Cardinality: One or more When used for regulatory submission, the Alias element is required for each ItemGroup that is part of a Domain that has been split into different datasets. When used for regulatory submission of SDTM, ADaM or SEND metadata, the Alias element is required for each CodeList that represents a CDISC Controlled Terminology and for each EnumeratedITem of CodeListItem element that represents a CDISC defined term in a CDISC Controlled Terminology.
DD0006-38;Missing required <element> value;/ODM/Study/MetaDataVersion/CodeList/CodeListItem/Alias;;Conditional Required;Alias;Requirement: Conditional Cardinality: One or more When used for regulatory submission, the Alias element is required for each ItemGroup that is part of a Domain that has been split into different datasets. When used for regulatory submission of SDTM, ADaM or SEND metadata, the Alias element is required for each CodeList that represents a CDISC Controlled Terminology and for each EnumeratedITem of CodeListItem element that represents a CDISC defined term in a CDISC Controlled Terminology.
DD0006-39;Missing required <element> value;/ODM/Study/MetaDataVersion/CodeList/EnumeratedItem/Alias;;Conditional Required;Alias;Requirement: Conditional Cardinality: One or more When used for regulatory submission, the Alias element is required for each ItemGroup that is part of a Domain that has been split into different datasets. When used for regulatory submission of SDTM, ADaM or SEND metadata, the Alias element is required for each CodeList that represents a CDISC Controlled Terminology and for each EnumeratedITem of CodeListItem element that represents a CDISC defined term in a CDISC Controlled Terminology.
DD0006-40;Missing required <element> value;/ODM/Study/MetaDataVersion/ItemDef;;Required;ItemDef;Requirement: Required Cardinality: An ItemDef element is required for each ItemOID value that appears in an ItemRef contained in a MetaDataVersion..
DD0006-41;Missing required <element> value;/ODM/Study/MetaDataVersion/ItemDef/CodeListRef;;Optional;CodeListRef;Requirement: Optional Cardinality: One Business Rule: If a variable or value definition includes Controlled Terminology a CodeList element should be provided as a child element on the ItemDef.
DD0006-42;Missing required <element> value;/ODM/Study/MetaDataVersion/ItemDef/def:ValueListRef;;Optional;def:ValueListRef;Requirement: Optional Cardinality: One
DD0006-43;Missing required <element> value;/ODM/Study/MetaDataVersion/ItemDef/def:Origin;;Conditional Required;def:Origin;Requirement: Conditional For regulatory submissions, def:Origin metadata must be provided for all SDTM, ADaM or SEND variables. It is at the sponsors discretion whether to provide def:Origin at the Variable or Value level. Cardinality: Zero or One. Business Rule: If the ItemDef corresponding to a SDTM, ADaM or SEND variable includes a def:ValueListRef and all of the ItemDef elements referenced in the corresponding def:ValueListDef include a def:Origin element, the def:Origin is optional with the variable level ItemDef. If the ItemDef corresponding to a SDTM, ADaM or SEND variable includes a def:ValueListRef and the def:Origin elements of ItemDef elements referenced in the corresponding def:ValueListDef are different, then the def:Origin can not be provided with the variable level ItemDef. If the variable or value is derived, the corresponding ItemDef must include a MethodOID attribute that references the corresponding MethodDef. When def:Origin/@Type=CRF, there must be a def:DocumentRef child element and def:DocumentRef/@leafID must match the ID attribute of the def:leaf element corresponding to the def:AnnotatedCRF within the same MetaDataVersion. Otherwise, def:DocumentRef/@leafID must match the ID of a defined def:leaf element within the same MetaDataVersion.
DD0006-44;Missing required <element> value;/ODM/Study/MetaDataVersion/CodeList;;Conditional Required;CodeList;Requirement: Conditional Cardinality: A CodeList element must be provided for each distinct value of the CodelistOID attribute in a CodeListRef element in the MetaDataVersion.
DD0006-45;Missing required <element> value;/ODM/Study/MetaDataVersion/CodeList/EnumeratedItem;;Conditional Required;EnumeratedItem;Requirement: Conditional Cardinality: Each CodeList element must contain either one or more EnumeratedItem elements, one or more CodeListItem elements or one ExternalCodelist element. Business Rules: For Controlled Terminologies, where there is just a list of allowed values, an EnumeratedItem must be provided for each Item included in the Terminology. The complete set of values relevant to the study must be provided whether or not they are referenced within the study data.
DD0006-46;Missing required <element> value;/ODM/Study/MetaDataVersion/CodeList/CodeListItem;;Conditional Required;CodeListItem;Requirement: Conditional Cardinality: Each CodeList element must contain either one or more EnumeratedItem elements, one or more CodeListItem elements or one ExternalCodelist element. Business Rules: For Controlled Terminologies where there are Coded and Decoded values, a CodeListItem must be provided for each Item included in the Terminology. The complete set of values relevant to the study must be provided whether or not they are referenced within the study data.
DD0006-47;Missing required <element> value;/ODM/Study/MetaDataVersion/CodeList/CodeListItem/Decode;;Required;Decode;Requirement: Required Cardinality: One Other Information: this element is the Container for Decode value, which is provided in the child element TranslatedText.
DD0006-48;Missing required <element> value;/ODM/Study/MetaDataVersion/CodeList/ExternalCodeList;;Conditional Required;ExternalCodeList;Requirement: Conditional For Controlled Terminologies provided by 3rd parties, an ExternalCodeList element must be provided to identify the Name and Version of the terminology. Cardinality: One Each CodeList element must contain either one or more EnumeratedItem elements, one or more CodeListItem elements or one ExternalCodelist element. Business Rule: Required for regulatory submissions to the FDA to provide the reference to the medical dictionaries used.
DD0006-49;Missing required <element> value;/ODM/Study/MetaDataVersion/MethodDef;;Conditional Required;MethodDef;Requirement: Conditional Cardinality: Required for each unique value of the MethodOID attribute within the MetaDataVersion Business Rule: Must contain the child Description element or the child def:DocumentRef element Other Information: When the algorithm is provided in an External file the def:leafID attribute of the MethodDef element must be included and the Description element can include a short descriptive reference to the External file. Note that each distinct method is expected to have a unique MethodOID and can be referenced from different variables.
DD0006-50;Missing required <element> value;/ODM/Study/MetaDataVersion/MethodDef/FormalExpression;;Optional;FormalExpression;text string Requirement: Optional Cardinality: Zero or More Business Rule: The FormalExpression must evaluate to the correct DataType of the ItemDef that is to be imputed or computed using the Method in the computer language specified under Context. Other Information: The way that the FormalExpression is to be combined with the rest of the code in the particular programming language specified in the Context attribute is outside of the scope of the Define-XML 2.0 specification.
DD0006-51;Missing required <element> value;/ODM/Study/MetaDataVersion/def:CommentDef;;Conditional Required;def:CommentDef;Requirement: Conditional Cardinality: Required for each unique value of the def:CommentOID attribute within the MetaDataVersion. Business Rule: Must contain the child Description element or the child def:DocumentRef element Other Information: When the comment is provided in an External file the def:leafID attribute of the def:CommentDef element must be included and the Description element can include a short descriptive reference to the External file. Note that each distinct comment is expected to have a unique def:CommentOID and can be referenced from different variables.
DD0006-52;Missing required <element> value;/ODM/Study/MetaDataVersion/def:leaf;;Required;def:leaf;Requirement: Required Cardinality: One for each def:DocumentRef or ItemGroupDef included in the define.xml document
DD0006-53;Missing required <element> value;/ODM/Study/MetaDataVersion/ItemGroupDef/def:leaf;;Required;def:leaf;Requirement: Required Cardinality: One for each def:DocumentRef or ItemGroupDef included in the define.xml document
DD0006-54;Missing required <element> value;/ODM/Study/MetaDataVersion/def:leaf/def:title;;Required;def:title;Text with the label for the document or dataset. It provides for a document title that differs from the file name, as may be found with annotated CRFs or supplemental documents. Requirement: Required Cardinality: One Other Information: Note that the def:title element has no attributes or child elements.
DD0020;Invalid def:DefineVersion value;/ODM/Study/MetaDataVersion;def:DefineVersion;PMDA;1.0.0 or  2.0.0 ;The def:DefineVersion should have a value of 1.0.0 for Define-XML v1.0 and 2.0.0 for Define-XML v2.0.
DD0021;Invalid Standard Name value <value>;/ODM/Study/MetaDataVersion;def:StandardName;PMDA;SDTM-IG or ADaM-IG;Standard Name must have a value of SDTM-IG or ADaM-IG. Define-XML specification represents Standard Name as def:StandardName attribute on MetaDataVersion element.
DD0022;Invalid Standard Version value <value> for <standard>;/ODM/Study/MetaDataVersion;def:StandardVersion;PMDA;3.1.2 or  3.1.3  or 3.2 for SDTM-IG;Standard Version must have a valid value for the given Standard Name. Allowed values are 3.1.2, 3.1.3, or 3.2 for SDTM-IG and 1.0 for ADaM-IG. Define-XML specification represents Standard Version as def:StandardVersion attribute on MetaDataVersion element.
DD0025;Invalid MedDRA Version <version>;/ODM/Study/MetaDataVersion/CodeList/ExternalCodeList[@Dictionary="MEDDRA"];Version;PMDA;NN.0 or NN.1 ( 9.0 or 14.1.);MedDRA version must be set to decimal value ending with 0 or 1, for example 9.0 or 14.1. Define-XML specification represents MedDRA version as Version attribute on ExternalCodeList element within CodeList element.
'

ms=Hash.new;xp=Hash.new;at=Hash.new;co=Hash.new
av=Hash.new;ds=Hash.new;id=Hash.new;va=Hash.new
i=0

checklist.each_line{|line|
sp=line.split(';')

ms[sp[0]]=sp[1] # Message
xp[sp[0]]=sp[2] # XPath
at[sp[0]]=sp[3] # Attribute
co[sp[0]]=sp[4] # Core
av[sp[0]]=sp[5] # Allowable Value
ds[sp[0]]=sp[6].chop # Description


define.elements.each(sp[2]) do |element|
id[i]=sp[0] # Rule ID

if id[i].start_with?("DD0006")  then
  va[i]=element.name
else
  va[i]=element.attributes[at[sp[0]]]
end

# Actual Check Rule
if av[sp[0]]=="Text"
  # Any text is allowable
  if sp[0]=="DD0003-30"
    # There is BUSINESS RULE: Reference to the unique ID of an ItemDef element.
    err = true
    define.elements.each('//ItemDef') do |itemdef|
      if(va[i] == itemdef.attributes['OID'])
        err = false
      end
    end
    if(err)
      i = i+1
    end
  end
elsif av[sp[0]]=="Integer" && co[sp[0]] == "Required"
  # Value which cannot be casted into integer should raise error.
  begin
    val = Integer(va[i])
  rescue ArgumentError
    i = i+1
  end
elsif av[sp[0]]=="Allowable Values: Yes No" && co[sp[0]] == "Required"
  # TODO:Methods to specify allowable codelist should be defined.
  if ! va[i].match(/(Yes|No)/)
    i = i+1
  end
else
  i=i+1
end
end
}
#DD0025


id[i]="OD0010"
ms["OD0010"]="Missing XML declaration"
xp["OD0010"]="ODM"
at["OD0010"]=""
co["OD0010"]="Required"
av["OD0010"]="Version Encoding"
ds["OD0010"]="Define.xml must start with an XML declaration."
va[i]= "ver " + define.xml_decl.version + " " + define.xml_decl.encoding
i=i+1




id[i]="OD0012"
ms["OD0012"]="Invalid root element"
xp["OD0012"]="ODM"
at["OD0012"]=""
co["OD0012"]="Required"
av["OD0012"]="ODM"
ds["OD0012"]="Define.xml must contain a root element called ODM."
va[i]= define.elements['/*'].name
i=i+1

n=Hash.new
n[i]=0;n[i+1]=0

id[i]="OD0022"
ms["OD0022"]="Duplicate Study OID"
xp["OD0022"]="all"
at["OD0022"]=""
co["OD0022"]="Unique"
av["OD0022"]="1"
ds["OD0022"]="The OID attribute for Study element must be unique within a related series of ODM documents."

id[i+1]="OD0027"
ms["OD0027"]="Duplicate MetaDataVersion OID"
xp["OD0027"]="all"
at["OD0027"]=""
co["OD0027"]="Unique"
av["OD0027"]="1"
ds["OD0027"]="The OID attribute for MetaDataVersion element must be unique within a single study."

define.elements.each('/*') do |element|
if element.name=="Study" then n[i]+=1;end;
if element.name=="MetaDataVersion" then n[i+1]+=1;end;
end;
define.elements.each('/*/*') do |element|
if element.name=="Study" then n[i]+=1;end;
if element.name=="MetaDataVersion" then n[i+1]+=1;end;
end;
define.elements.each('/*/*/*') do |element|
if element.name=="Study" then n[i]+=1;end;
if element.name=="MetaDataVersion" then n[i+1]+=1;end;
end;
define.elements.each('/*/*/*/*') do |element|
if element.name=="Study" then n[i]+=1;end;
if element.name=="MetaDataVersion" then n[i+1]+=1;end;
end;
define.elements.each('/*/*/*/*/*') do |element|
if element.name=="Study" then n[i]+=1;end;
if element.name=="MetaDataVersion" then n[i+1]+=1;end;
end;
define.elements.each('/*/*/*/*/*/*') do |element|
if element.name=="Study" then n[i]+=1;end;
if element.name=="MetaDataVersion" then n[i+1]+=1;end;
end;
define.elements.each('/*/*/*/*/*/*/*') do |element|
if element.name=="Study" then n[i]+=1;end;
if element.name=="MetaDataVersion" then n[i+1]+=1;end;
end;

va[i]=n[i].to_s
va[i+1]=n[i+1].to_s
i=i+1


out_file = open(Date.today.to_s+"_definecheck.csv","w")

out_file.puts("n,ID,Message,XPath,Attribute,Core,Value,Allowable Value,Description")
for j in 1..i

if va[j]==nil then va[j]="<NULL>" end
if ds[id[j]]==nil then ds[id[j]]="<CHECK>" end
text= '"' + j.to_s  + '","' + id[j] + '",""' + ms[id[j]] + '","' + xp[id[j]] \
+ '","' + at[id[j]] + '","' + co[id[j]] + '",="' + va[j] + '","' + av[id[j]] \
+ '","' + ds[id[j]] + '"'
out_file.puts text.encode("Windows-31J")
end

out_file.puts ""
out_file.puts(',,PMDA define Reject Checker ver.0.1,"for DD0002,3,620,21,22,25,OD0010,12,22,27 by Osamu Kotera",,,,,')
out_file.puts(',,"for DD0002,3,620,21,22,25,OD0010,12,22,27 by Osamu Kotera",,,,,,')
out_file.puts(',,"by Osamu Kotera",,,,,,')





out_file.close
