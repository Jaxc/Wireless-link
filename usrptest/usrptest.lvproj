<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="13008000">
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">false</Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="NI.SortType" Type="Int">3</Property>
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Project Documentation" Type="Folder">
			<Property Name="NI.SortType" Type="Int">0</Property>
			<Item Name="Simple NI-USRP Streaming.html" Type="Document" URL="../documentation/Simple NI-USRP Streaming.html"/>
		</Item>
		<Item Name="Rx/Tx" Type="Folder">
			<Property Name="NI.SortType" Type="Int">0</Property>
			<Item Name="Details" Type="Folder">
				<Property Name="NI.SortType" Type="Int">0</Property>
				<Item Name="Fetch Rx Data (1D CDB WDT).vi" Type="VI" URL="../Host/SubVIs/Fetch Rx Data (1D CDB WDT).vi"/>
				<Item Name="Fetch Rx Data (CDB WDT).vi" Type="VI" URL="../Host/SubVIs/Fetch Rx Data (CDB WDT).vi"/>
				<Item Name="Fetch Rx Data (I16 multi).vi" Type="VI" URL="../Host/SubVIs/Fetch Rx Data (I16 multi).vi"/>
				<Item Name="Fetch Rx Data (I16).vi" Type="VI" URL="../Host/SubVIs/Fetch Rx Data (I16).vi"/>
				<Item Name="Fetch Rx Data (U32).vi" Type="VI" URL="../Host/SubVIs/Fetch Rx Data (U32).vi"/>
				<Item Name="Generate Waveform (Interleaved).vi" Type="VI" URL="../Host/SubVIs/Generate Waveform (Interleaved).vi"/>
				<Item Name="Generate Waveform (Multi-Array).vi" Type="VI" URL="../Host/SubVIs/Generate Waveform (Multi-Array).vi"/>
				<Item Name="Rx FPGA VI Reference.ctl" Type="VI" URL="../Host/SubVIs/Rx FPGA VI Reference.ctl"/>
				<Item Name="Start Trigger.ctl" Type="VI" URL="../Host/SubVIs/Start Trigger.ctl"/>
				<Item Name="Tx FPGA VI Reference.ctl" Type="VI" URL="../Host/SubVIs/Tx FPGA VI Reference.ctl"/>
				<Item Name="Write Tx Data (CDB WDT).vi" Type="VI" URL="../Host/SubVIs/Write Tx Data (CDB WDT).vi"/>
				<Item Name="Write Tx Data (I16 multi).vi" Type="VI" URL="../Host/SubVIs/Write Tx Data (I16 multi).vi"/>
				<Item Name="Write Tx Data (I16).vi" Type="VI" URL="../Host/SubVIs/Write Tx Data (I16).vi"/>
				<Item Name="Write Tx Data (U32).vi" Type="VI" URL="../Host/SubVIs/Write Tx Data (U32).vi"/>
			</Item>
			<Item Name="Abort Stream.vi" Type="VI" URL="../Host/SubVIs/Abort Stream.vi"/>
			<Item Name="Close Device.vi" Type="VI" URL="../Host/SubVIs/Close Device.vi"/>
			<Item Name="Fetch Rx Data.vi" Type="VI" URL="../Host/SubVIs/Fetch Rx Data.vi"/>
			<Item Name="Generate Waveform.vi" Type="VI" URL="../Host/SubVIs/Generate Waveform.vi"/>
			<Item Name="Initiate Stream.vi" Type="VI" URL="../Host/SubVIs/Initiate Stream.vi"/>
			<Item Name="Multi Device Initiate.vi" Type="VI" URL="../Host/SubVIs/Multi Device Initiate.vi"/>
			<Item Name="Open Device.vi" Type="VI" URL="../Host/SubVIs/Open Device.vi"/>
			<Item Name="Send Software Start Trigger.vi" Type="VI" URL="../Host/SubVIs/Send Software Start Trigger.vi"/>
			<Item Name="Write Tx Data.vi" Type="VI" URL="../Host/SubVIs/Write Tx Data.vi"/>
		</Item>
		<Item Name="Configuration" Type="Folder">
			<Property Name="NI.SortType" Type="Int">0</Property>
			<Item Name="Details" Type="Folder">
				<Property Name="NI.SortType" Type="Int">0</Property>
				<Item Name="Configure Signal (Common).vi" Type="VI" URL="../Host/SubVIs/Configure Signal (Common).vi"/>
				<Item Name="Configure Signal (Gain).vi" Type="VI" URL="../Host/SubVIs/Configure Signal (Gain).vi"/>
				<Item Name="Configure Signal (Level).vi" Type="VI" URL="../Host/SubVIs/Configure Signal (Level).vi"/>
				<Item Name="Configure Signal Mode.ctl" Type="VI" URL="../Host/SubVIs/Configure Signal Mode.ctl"/>
				<Item Name="Configure Signal Parameters.ctl" Type="VI" URL="../Host/SubVIs/Configure Signal Parameters.ctl"/>
			</Item>
			<Item Name="Configure Clocks.vi" Type="VI" URL="../Host/SubVIs/Configure Clocks.vi"/>
			<Item Name="Configure Frequency Shift.vi" Type="VI" URL="../Host/SubVIs/Configure Frequency Shift.vi"/>
			<Item Name="Configure Frequency.vi" Type="VI" URL="../Host/SubVIs/Configure Frequency.vi"/>
			<Item Name="Configure Signal.vi" Type="VI" URL="../Host/SubVIs/Configure Signal.vi"/>
			<Item Name="Configure Start Trigger.vi" Type="VI" URL="../Host/SubVIs/Configure Start Trigger.vi"/>
			<Item Name="Configure Stream.vi" Type="VI" URL="../Host/SubVIs/Configure Stream.vi"/>
			<Item Name="Configure Synchronization.vi" Type="VI" URL="../Host/SubVIs/Configure Synchronization.vi"/>
			<Item Name="Configure Trigger Synchronization.vi" Type="VI" URL="../Host/SubVIs/Configure Trigger Synchronization.vi"/>
		</Item>
		<Item Name="Utilities" Type="Folder">
			<Property Name="NI.SortType" Type="Int">0</Property>
			<Item Name="Calculate IQ Power Level.vi" Type="VI" URL="../Host/SubVIs/Calculate IQ Power Level.vi"/>
			<Item Name="Calculate Power Spectrum (1D CDB WDT).vi" Type="VI" URL="../Host/SubVIs/Calculate Power Spectrum (1D CDB WDT).vi"/>
			<Item Name="Calculate Power Spectrum.vi" Type="VI" URL="../Host/SubVIs/Calculate Power Spectrum.vi"/>
			<Item Name="Calculate Sample Rate.vi" Type="VI" URL="../Host/SubVIs/Calculate Sample Rate.vi"/>
			<Item Name="Check Stream Status.vi" Type="VI" URL="../Host/SubVIs/Check Stream Status.vi"/>
			<Item Name="Construct Channels.vi" Type="VI" URL="../Host/SubVIs/Construct Channels.vi"/>
			<Item Name="Lock to GPS.vi" Type="VI" URL="../Host/SubVIs/Lock to GPS.vi"/>
		</Item>
		<Item Name="Rx Streaming (Host).vi" Type="VI" URL="../Host/Rx Streaming (Host).vi"/>
		<Item Name="Tx Streaming (Host).vi" Type="VI" URL="../Host/Tx Streaming (Host).vi"/>
		<Item Name="Rx Streaming Multi-Channel (Host).vi" Type="VI" URL="../Host/Rx Streaming Multi-Channel (Host).vi"/>
		<Item Name="Full Duplex Streaming (Host).vi" Type="VI" URL="../Host/Full Duplex Streaming (Host).vi"/>
		<Item Name="MIMO Rx Streaming Multi-Channel (Host).vi" Type="VI" URL="../Host/MIMO Rx Streaming Multi-Channel (Host).vi"/>
		<Item Name="MIMO Tx Streaming Multi-Channel (Host).vi" Type="VI" URL="../Host/MIMO Tx Streaming Multi-Channel (Host).vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Property Name="NI.SortType" Type="Int">0</Property>
			<Item Name="instr.lib" Type="Folder">
				<Item Name="LMK04816 v1 Shared.lvlib" Type="Library" URL="/&lt;instrlib&gt;/niUsrpRio/Register Maps/LMK04816/v1/Shared/LMK04816 v1 Shared.lvlib"/>
				<Item Name="niInstr Basic Elements v1 FPGA.lvlib" Type="Library" URL="/&lt;instrlib&gt;/_niInstr/Basic Elements/v1/FPGA/niInstr Basic Elements v1 FPGA.lvlib"/>
				<Item Name="niInstr DSP v1 Shared.lvlib" Type="Library" URL="/&lt;instrlib&gt;/_niInstr/DSP/v1/Shared/niInstr DSP v1 Shared.lvlib"/>
				<Item Name="niInstr Register Bus v0 Host.lvlib" Type="Library" URL="/&lt;instrlib&gt;/_niInstr/Register Bus/v0/Host/niInstr Register Bus v0 Host.lvlib"/>
				<Item Name="niInstr Register Bus v1 FPGA.lvlib" Type="Library" URL="/&lt;instrlib&gt;/_niInstr/Register Bus/v1/FPGA/niInstr Register Bus v1 FPGA.lvlib"/>
				<Item Name="niUSRP Close Session.vi" Type="VI" URL="/&lt;instrlib&gt;/niUSRP/niUSRP Close Session.vi"/>
				<Item Name="niUSRP Commit.vi" Type="VI" URL="/&lt;instrlib&gt;/niUSRP/niUSRP Commit.vi"/>
				<Item Name="niUSRP Get Error.vi" Type="VI" URL="/&lt;instrlib&gt;/niUSRP/niUSRP Get Error.vi"/>
				<Item Name="niUSRP Get Register Packets.vi" Type="VI" URL="/&lt;instrlib&gt;/niUSRP/niUSRP Get Register Packets.vi"/>
				<Item Name="niUSRP Open Session With Options.vi" Type="VI" URL="/&lt;instrlib&gt;/niUSRP/niUSRP Open Session With Options.vi"/>
				<Item Name="niUSRP Set Attribute (DBL).vi" Type="VI" URL="/&lt;instrlib&gt;/niUSRP/niUSRP Set Attribute (DBL).vi"/>
				<Item Name="niUSRP Settings Packet Destination.ctl" Type="VI" URL="/&lt;instrlib&gt;/niUSRP/niUSRP Settings Packet Destination.ctl"/>
				<Item Name="niUSRP Settings Packet.ctl" Type="VI" URL="/&lt;instrlib&gt;/niUSRP/niUSRP Settings Packet.ctl"/>
				<Item Name="niUsrpRio Config v1 FPGA.lvlib" Type="Library" URL="/&lt;instrlib&gt;/niUsrpRio/Config/v1/FPGA/niUsrpRio Config v1 FPGA.lvlib"/>
				<Item Name="niUsrpRio Config v1 Host.lvlib" Type="Library" URL="/&lt;instrlib&gt;/niUsrpRio/Config/v1/Host/niUsrpRio Config v1 Host.lvlib"/>
				<Item Name="niUsrpRio Config v1 Shared.lvlib" Type="Library" URL="/&lt;instrlib&gt;/niUsrpRio/Config/v1/Shared/niUsrpRio Config v1 Shared.lvlib"/>
				<Item Name="niUsrpRio Synchronization v1 Host.lvlib" Type="Library" URL="/&lt;instrlib&gt;/niUsrpRio/Synchronization/v1/Host/niUsrpRio Synchronization v1 Host.lvlib"/>
				<Item Name="niUsrpRio Synchronization v1 Shared.lvlib" Type="Library" URL="/&lt;instrlib&gt;/niUsrpRio/Synchronization/v1/Shared/niUsrpRio Synchronization v1 Shared.lvlib"/>
			</Item>
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Acquire Semaphore.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Acquire Semaphore.vi"/>
				<Item Name="AddNamedSemaphorePrefix.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/AddNamedSemaphorePrefix.vi"/>
				<Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
				<Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
				<Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
				<Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
				<Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
				<Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
				<Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
				<Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
				<Item Name="FormatTime String.vi" Type="VI" URL="/&lt;vilib&gt;/express/express execution control/ElapsedTimeBlock.llb/FormatTime String.vi"/>
				<Item Name="General Error Handler CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler CORE.vi"/>
				<Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
				<Item Name="Get String Text Bounds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Get String Text Bounds.vi"/>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
				<Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
				<Item Name="GetNamedSemaphorePrefix.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/GetNamedSemaphorePrefix.vi"/>
				<Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="NI_AALBase.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALBase.lvlib"/>
				<Item Name="NI_AALPro.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALPro.lvlib"/>
				<Item Name="NI_MABase.lvlib" Type="Library" URL="/&lt;vilib&gt;/measure/NI_MABase.lvlib"/>
				<Item Name="NI_MAPro.lvlib" Type="Library" URL="/&lt;vilib&gt;/measure/NI_MAPro.lvlib"/>
				<Item Name="nirviEmuTemplateMethod_errors.vi" Type="VI" URL="/&lt;vilib&gt;/rvi/eio/Common/nirviEmuTemplateMethod_errors.vi"/>
				<Item Name="Not A Semaphore.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Not A Semaphore.vi"/>
				<Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
				<Item Name="Obtain Semaphore Reference.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Obtain Semaphore Reference.vi"/>
				<Item Name="Release Semaphore Reference.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Release Semaphore Reference.vi"/>
				<Item Name="Release Semaphore.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Release Semaphore.vi"/>
				<Item Name="RemoveNamedSemaphorePrefix.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/RemoveNamedSemaphorePrefix.vi"/>
				<Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
				<Item Name="Semaphore RefNum" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Semaphore RefNum"/>
				<Item Name="Semaphore Refnum Core.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Semaphore Refnum Core.ctl"/>
				<Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
				<Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
				<Item Name="Simple Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Simple Error Handler.vi"/>
				<Item Name="Space Constant.vi" Type="VI" URL="/&lt;vilib&gt;/dlg_ctls.llb/Space Constant.vi"/>
				<Item Name="subElapsedTime.vi" Type="VI" URL="/&lt;vilib&gt;/express/express execution control/ElapsedTimeBlock.llb/subElapsedTime.vi"/>
				<Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="Validate Semaphore Size.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/semaphor.llb/Validate Semaphore Size.vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
			</Item>
			<Item Name="lvanlys.dll" Type="Document" URL="/&lt;resource&gt;/lvanlys.dll"/>
			<Item Name="NiFpgaLv.dll" Type="Document" URL="NiFpgaLv.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="niusrp.dll" Type="Document" URL="niusrp.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="Stream Control State.ctl" Type="VI" URL="../../../../../../Program Files (x86)/National Instruments/LabVIEW 2013/ProjectTemplates/Source/NI-USRP/Simple NI-USRP Streaming/FPGA/SubVIs/Stream Control State.ctl"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
