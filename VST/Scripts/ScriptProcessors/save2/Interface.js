Content.makeFrontInterface(568, 320);

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
    sampler2.loadSampleMap("blanco");
}

function kolitong(){
    Panel2.showControl(0);
    Panel3.showControl(1);
    sampler1.loadSampleMap("blanko");
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
 