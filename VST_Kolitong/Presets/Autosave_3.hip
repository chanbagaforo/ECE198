Processor 
Type SynthChain ID save5 Bypassed Gain 	      �?Balance 	        VoiceLimit 	      P@KillFadeTime 	      4@IconColour 0 packageName  BuildVersion �  EditorStates BodyShown 0 Visible 1 Solo 0 Folded 1  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors  Processor Type ScriptProcessor ID Interface Bypassed Script :Content.makeFrontInterface(568, 320);

//declarations
const var Label1 = Content.getComponent("Label1");
const var Panel2 = Content.getComponent("Panel2");
const var Panel3 = Content.getComponent("Panel3");

//sampler
const var sampleList = Sampler.getSampleMapList();
const var sampler1 = Synth.getSampler("Sampler1");
const var sampler2 = Synth.getSampler("Sampler2");


//combobox
const var ComboBox1 = Content.getComponent("ComboBox1");
Content.getComponent("ComboBox1").set("text","...");

inline function onComboBox1Control(component, value)
{
    if(ComboBox1.getItemText() == "..."){
        blank();
        Content.getComponent("Label1").set("text","Kalinga Instruments");
    }
    else{
        if(ComboBox1.getItemText() == "Tongali") tongali();
        if(ComboBox1.getItemText() == "Kolitong") kolitong();
        Content.getComponent("Label1").set("text",ComboBox1.getItemText());
    };
}

Content.getComponent("ComboBox1").setControlCallback(onComboBox1Control);


//instrument functions
function tongali(){
    Panel2.showControl(1);
    Panel3.showControl(0);
    sampler1.loadSampleMap("tongali");
    sampler2.loadSampleMap("blank1");
}

function kolitong(){
    Panel2.showControl(0);
    Panel3.showControl(1);
    sampler1.loadSampleMap("blank");
    sampler2.loadSampleMap("kolitong");
}

function blank(){
    Panel2.showControl(0);
    Panel3.showControl(0);
}function onNoteOn()
{
	
}
 function onNoteOff()
{
	
}
 function onController()
{
	
}
 function onTimer()
{
	
}
 function onControl(number, value)
{
	
}
  EditorStates BodyShown 1 Visible 1 Solo 0 contentShown 1 onInitOpen 1  ChildProcessors   Content  Control type ScriptComboBox id ComboBox1 value 	      @ Control type ScriptLabel id Label1 value 
Kolitong  Control type ScriptLabel id Label2 value Instrument:  UIData  ContentProperties DeviceType 	Desktop Component type ScriptPanel id Panel1 x 	        y 	        width 	     ��@height 	      t@itemColour2 855638015 itemColour 855638015 Component 	type ScriptComboBox id ComboBox1 x 	      Y@y 	     �p@max    parentComponent Panel1 items ...
Tongali
Kolitong height 	      >@text ...  Component 
type ScriptLabel id Label1 x 	      9@y 	      9@parentComponent Panel1 width 	     `x@height 	     �K@fontSize 	      B@alignment left text 
Kolitong  Component 	type ScriptLabel id Label2 x 	      9@y 	     �p@text Instrument: height 	      >@width 	     �R@fontSize 	      (@parentComponent Panel1  Component type ScriptPanel id Panel2 x 	        y 	     @Q@width 	     ��@height 	      i@itemColour 0 itemColour2 0 bgColour 
16777215 textColour 
16777215 visible Component type ScriptImage id Image1 x 	     �`@y 	      D@parentComponent Panel2 fileName {PROJECT_FOLDER}tongali.png width 	     �r@height 	      ^@ Component 
type ScriptPanel id Panel3 x 	        y 	     @Q@width 	     ��@height 	      i@bgColour 
16777215 itemColour 0 itemColour2 0 textColour 
16777215 Component type ScriptImage id Image2 x 	     `b@y 	      "�parentComponent Panel3 fileName {PROJECT_FOLDER}kulitong2.png width 	     �q@height 	     �j@ Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type StreamingSampler ID 
Sampler1 Bypassed Gain 	      �?Balance 	        VoiceLimit 	      p@KillFadeTime 	      4@IconColour 0 PreloadSize 	      �@BufferSize 	      �@VoiceAmount 	      p@SamplerRepeatMode 	       @RRGroupAmount 	      �?PitchTracking 	      �?OneShot 	        CrossfadeGroups 	        Purged 	        Reversed 	        NumChannels    UseStaticMatrix 	        Group0Table  Group1Table  Group2Table  Group3Table  Group4Table  Group5Table  Group6Table  Group7Table  SampleMapID  EditorStates BodyShown 1 Visible 1 Solo 0 MapPanelShown 1 BigSampleMap 1 Folded 1 CrossfadeTableShown 0  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors  Processor 	Type SimpleEnvelope ID DefaultEnvelope1 Bypassed Monophonic 	        Retrigger 	      �?Intensity 	      �?Attack 	      @Release 	      $@LinearMode 	      �?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Attack Time Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Sample Start Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Group Fade Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� channels  channelData enabled level 	        suffix   Processor Type StreamingSampler ID 
Sampler2 Bypassed Gain 	      �?Balance 	        VoiceLimit 	      p@KillFadeTime 	      4@IconColour 0 PreloadSize 	      �@BufferSize 	      �@VoiceAmount 	      p@SamplerRepeatMode 	        RRGroupAmount 	      �?PitchTracking 	      �?OneShot 	      �?CrossfadeGroups 	        Purged 	        Reversed 	        NumChannels    UseStaticMatrix 	        Group0Table  Group1Table  Group2Table  Group3Table  Group4Table  Group5Table  Group6Table  Group7Table  SampleMapID  EditorStates BodyShown 1 Visible 1 Solo 0 MapPanelShown 1 BigSampleMap 1 Folded 1 CrossfadeTableShown 0  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors  Processor 	Type SimpleEnvelope ID DefaultEnvelope2 Bypassed Monophonic 	        Retrigger 	      �?Intensity 	      �?Attack 	      @Release 	      $@LinearMode 	      �?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Attack Time Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Sample Start Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Group Fade Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� channels  channelData enabled level 	        suffix   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� macro_controls  macro name 	Macro 1 value 0.0 midi_cc -1  macro name 	Macro 2 value 0.0 midi_cc -1  macro name 	Macro 3 value 0.0 midi_cc -1  macro name 	Macro 4 value 0.0 midi_cc -1  macro name 	Macro 5 value 0.0 midi_cc -1  macro name 	Macro 6 value 0.0 midi_cc -1  macro name 	Macro 7 value 0.0 midi_cc -1  macro name 	Macro 8 value 0.0 midi_cc -1  MidiAutomation   MPEData Enabled  