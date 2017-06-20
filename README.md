# Monitor-Windows-Memory
get crazy and monitor every memory metric Windows has to offer.

Here's an example pulled from one of my lab servers.
 
AvailableBytes 27439579136
AvailableKBytes 26796464
AvailableMBytes 26168
CacheBytes 327782400
CacheBytesPeak 462045184
CacheFaultsPersec 0
CommitLimit 39092871168
CommittedBytes 6533398528
DemandZeroFaultsPersec 7
FreeAndZeroPageListBytes 16650915840
FreeSystemPageTableEntries 12253058
LongTermAverageStandbyCacheLifetimes 14400
ModifiedPageListBytes 392167424
PageFaultsPersec 23
PageReadsPersec 0
PagesInputPersec 0
PagesOutputPersec 0
PagesPersec 0
PageWritesPersec 0
PercentCommittedBytesInUse 16
PoolNonpagedAllocs 576292
PoolNonpagedBytes 411185152
PoolPagedAllocs 1053045
PoolPagedBytes 823783424
PoolPagedResidentBytes 750845952
StandbyCacheCoreBytes 146513920
StandbyCacheNormalPriorityBytes 5149515776
StandbyCacheReserveBytes 5492633600
SystemCacheResidentBytes 0
SystemCodeResidentBytes 0
SystemCodeTotalBytes 0
SystemDriverResidentBytes 37740544
SystemDriverTotalBytes 28606464
TransitionFaultsPersec 15
TransitionPagesRePurposedPersec 0
WriteCopiesPersec 0

​---------------------------------Installation----------------------------------------
1. ​Download the zip and unpack into the uptime folder ie: c:\program files\uptime software\uptime   it will ask if you want to overwrite the plugins and scripts folders, just say yes. This just copies the stuff needed for the plugin into the proper spots. 
2. Next, move Monitor-Windows-Memory.xml into the uptime\xml folder.
3. Open a command prompt as administrator
4. Navigate to uptime\scripts and run erdcloader.exe -x "c:\program files\uptime software\uptime​\xml\Monitor-Windows-Memory.xml"
5. The plugin should now be added into uptime and available in the add service monitor dialogue, under "Operating System Monitors" as Monitor Windows Memory.
 
---------------------------------Uninstall-----------------------------------------
To remove the plugin, ensure any service monitors using it have been deleted, then, in an administrative command prompt, from the uptime\scripts directory, run erdcdeleter -n "Monitor Windows Memory"
 
Also, I made a batch file to do that for you, github.com/.../remove_Monitor_Windows_Memory.bat
