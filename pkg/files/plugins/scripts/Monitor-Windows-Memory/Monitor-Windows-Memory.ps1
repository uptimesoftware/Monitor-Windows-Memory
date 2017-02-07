$UPT_USERNAME = Get-ChildItem Env:UPTIME_USERNAME | select -expand value;
$UPT_PASSWORD = Get-ChildItem Env:UPTIME_PASSWORD | select -expand value;
$UPT_HOSTNAME = Get-ChildItem Env:UPTIME_HOSTNAME | select -expand value;
$UPT_AUTHENTICATE = Get-ChildItem Env:UPTIME_AUTHENTICATE | select -expand value;
$UPT_WMICLASS = 'Win32_PerfFormattedData_PerfOS_Memory';

If($UPT_AUTHENTICATE -eq "true") {$credential = New-Object System.Management.Automation.PsCredential($UPT_USERNAME, (ConvertTo-SecureString $UPT_PASSWORD -AsPlainText -Force))}

#Retrieve data from WMI using authentication or not depending on choice
If($UPT_AUTHENTICATE -eq "true")
{
	$collitems = Get-WMIObject -Credential $credential -Class $UPT_WMICLASS -ComputerName $UPT_HOSTNAME
}
ELSE 
{
	$collitems = Get-WMIObject -Class $UPT_WMICLASS -ComputerName $UPT_HOSTNAME	
}
#list the member properties and filter out the junk
$collitems_members = $collitems | gm -membertype properties | select -expand Name | ?{@("Name","PSComputerNAme","__Class","__DERIVATION","__DYNASTY","__GENUS","__NAMESPACE","__PATH","__PROPERTY_COUNT","__RELPATH","__SERVER","__SUPERCLASS","Description","Caption","Timestamp_Object","Timestamp_PerfTime","Timestamp_Sys100NS","Frequency_Object","Frequency_PerfTime","Frequency_Sys100NS") -notcontains $_}
#run through each object and their properties
foreach ($objitem in $collitems) {
	foreach ($objmember in $collitems_members) {
		Write-Host $objmember,' ',$objitem.$objmember
	}
}
<#
AvailableBytes   27439579136
AvailableKBytes   26796464
AvailableMBytes   26168
CacheBytes   327782400
CacheBytesPeak   462045184
CacheFaultsPersec   0
CommitLimit   39092871168
CommittedBytes   6533398528
DemandZeroFaultsPersec   7
FreeAndZeroPageListBytes   16650915840
FreeSystemPageTableEntries   12253058
LongTermAverageStandbyCacheLifetimes   14400
ModifiedPageListBytes   392167424
PageFaultsPersec   23
PageReadsPersec   0
PagesInputPersec   0
PagesOutputPersec   0
PagesPersec   0
PageWritesPersec   0
PercentCommittedBytesInUse   16
PoolNonpagedAllocs   576292
PoolNonpagedBytes   411185152
PoolPagedAllocs   1053045
PoolPagedBytes   823783424
PoolPagedResidentBytes   750845952
StandbyCacheCoreBytes   146513920
StandbyCacheNormalPriorityBytes   5149515776
StandbyCacheReserveBytes   5492633600
SystemCacheResidentBytes   0
SystemCodeResidentBytes   0
SystemCodeTotalBytes   0
SystemDriverResidentBytes   37740544
SystemDriverTotalBytes   28606464
TransitionFaultsPersec   15
TransitionPagesRePurposedPersec   0
WriteCopiesPersec   0

#>