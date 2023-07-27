# Sensor-Fusion_Vehicle-Localisation-and-Tracking

<div class=WordSection1>

<h1>Sensor Fusion ENG09040, Course Project:<span style='mso-spacerun:yes'> 
</span>Vehicle Localisation and Tracking</h1>

<p class=Text>Student ID: S00241134</p>

<p class=Text>Student Name: Senan Stanley</p>

<p class=Text><o:p>&nbsp;</o:p></p>

<p class=Text>This project records the steps required to produce localisation
and tracking results from an <span class=GramE>eight node</span> sensor
network, from collection to conclusions.</p>

<p class=Text>The data gathering was completed in a Virtual laboratory
environment, using simulated microphones to gather information on a moving
vehicle. The microphone models and data were calibrated to offset bias and two
sensor networks were created to model the entire system. The TDOA sensor
networks were populated and analysed for optimal design. WLS was used to snapshot
localise the network and compare between the two implementations. Further
tracking algorithms such as EKF and UKF were implemented to simulate a true
live tracking scenario. Results from the models were compared and contrasted
with <span class=SpellE>eachother</span> to reach a conclusion on the best
model for this system. </p>

<p class=Text><o:p>&nbsp;</o:p></p>

<h1>Task 3.0: Data Gathering</h1>

<p class=Text>The first task of this project was to gather the data from the
virtual laboratory environment.</p>

<p class=Text>In the calibration mode all microphones were placed an
equidistance from the vehicle. which remained stationary and produced a
sequence <span class=GramE>of<span style='mso-spacerun:yes'>  </span>orthogonal</span>
frequency-division multiplexing (OFDM) signals. In this phase data was gathered
in order to inform on the bias of each microphone in the network.</p>

<p class=Text>In the next phase the microphones were distributed around the
track map randomly, but not too close to <span class=SpellE>eachother</span> as
to render any single microphone redundant. The vehicle drove around the track
for a lap and a half, the microphone data and sampling times were recorded.</p>

<p class=Text>Each of the calibration measurements and true measurements were
processed using the provided <span style='position:relative;top:3.5pt;
mso-text-raise:-3.5pt;mso-no-proof:yes'><!--[if gte vml 1]><v:shapetype id="_x0000_t75"
 coordsize="21600,21600" o:spt="75" o:preferrelative="t" path="m@4@5l@4@11@9@11@9@5xe"
 filled="f" stroked="f">
 <v:stroke joinstyle="miter"/>
 <v:formulas>
  <v:f eqn="if lineDrawn pixelLineWidth 0"/>
  <v:f eqn="sum @0 1 0"/>
  <v:f eqn="sum 0 0 @1"/>
  <v:f eqn="prod @2 1 2"/>
  <v:f eqn="prod @3 21600 pixelWidth"/>
  <v:f eqn="prod @3 21600 pixelHeight"/>
  <v:f eqn="sum @0 0 1"/>
  <v:f eqn="prod @6 1 2"/>
  <v:f eqn="prod @7 21600 pixelWidth"/>
  <v:f eqn="sum @8 21600 0"/>
  <v:f eqn="prod @7 21600 pixelHeight"/>
  <v:f eqn="sum @10 21600 0"/>
 </v:formulas>
 <v:path o:extrusionok="f" gradientshapeok="t" o:connecttype="rect"/>
 <o:lock v:ext="edit" aspectratio="t"/>
</v:shapetype><v:shape id="_x0000_i1056" type="#_x0000_t75" style='width:90.75pt;
 height:15.75pt;visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image001.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=121 height=21
src="Project_skeletonCode_files/image002.gif" v:shapes="_x0000_i1056"><![endif]></span><span
style='mso-spacerun:yes'> </span>function, which converted the signal data into
received pulse times for each microphone.</p>

<p class=Text>The microphone's cartesian coordinates were:</p>

<p class=Text><span style='position:relative;top:18.0pt;mso-text-raise:-18.0pt;
mso-no-proof:yes'><!--[if gte vml 1]><v:shape id="_x0000_i1055" type="#_x0000_t75"
 style='width:249.75pt;height:45pt;visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image003.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=333 height=60
src="Project_skeletonCode_files/image004.gif" v:shapes="_x0000_i1055"><![endif]></span></p>

<h1>Task 3.1: Calibration step</h1>

<p class=Text><b style='mso-bidi-font-weight:normal'>All 8 microphones must now
be calibrated to find their relative bias and the error present in each.</b></p>

<p class=Text>The sensor model with time measurement is set up as: <b
style='mso-bidi-font-weight:normal'><i style='mso-bidi-font-style:normal'><span
style='mso-spacerun:yes'> </span></i></b></p>

<p class=Text><span style='position:relative;top:4.0pt;mso-text-raise:-4.0pt;
mso-no-proof:yes'><!--[if gte vml 1]><v:shape id="_x0000_i1054" type="#_x0000_t75"
 style='width:162pt;height:15pt;visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image005.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=216 height=20
src="Project_skeletonCode_files/image006.gif" v:shapes="_x0000_i1054"><![endif]></span></p>

<p class=Text>Where <span style='position:relative;top:3.5pt;mso-text-raise:
-3.5pt;mso-no-proof:yes'><!--[if gte vml 1]><v:shape id="_x0000_i1053" type="#_x0000_t75"
 style='width:5.25pt;height:13.5pt;visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image007.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=7 height=18
src="Project_skeletonCode_files/image008.gif" v:shapes="_x0000_i1053"><![endif]></span><span
style='mso-spacerun:yes'> </span>denotes the <span style='position:relative;
top:3.5pt;mso-text-raise:-3.5pt;mso-no-proof:yes'><!--[if gte vml 1]><v:shape
 id="_x0000_i1052" type="#_x0000_t75" style='width:11.25pt;height:14.25pt;
 visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image009.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=15 height=19
src="Project_skeletonCode_files/image010.gif" v:shapes="_x0000_i1052"><![endif]></span><span
style='mso-spacerun:yes'> </span>sensor, and <span style='position:relative;
top:3.5pt;mso-text-raise:-3.5pt;mso-no-proof:yes'><!--[if gte vml 1]><v:shape
 id="_x0000_i1051" type="#_x0000_t75" style='width:7.5pt;height:13.5pt;
 visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image011.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=10 height=18
src="Project_skeletonCode_files/image012.gif" v:shapes="_x0000_i1051"><![endif]></span><span
style='mso-spacerun:yes'> </span>denotes the <span style='position:relative;
top:3.5pt;mso-text-raise:-3.5pt;mso-no-proof:yes'><!--[if gte vml 1]><v:shape
 id="_x0000_i1050" type="#_x0000_t75" style='width:13.5pt;height:14.25pt;
 visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image013.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=18 height=19
src="Project_skeletonCode_files/image014.gif" v:shapes="_x0000_i1050"><![endif]></span><span
style='mso-spacerun:yes'> </span>measurement. <span style='position:relative;
top:4.0pt;mso-text-raise:-4.0pt;mso-no-proof:yes'><!--[if gte vml 1]><v:shape
 id="_x0000_i1049" type="#_x0000_t75" style='width:9pt;height:15pt;
 visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image015.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=12 height=20
src="Project_skeletonCode_files/image016.gif" v:shapes="_x0000_i1049"><![endif]></span><span
style='mso-spacerun:yes'> </span>is the time when the first signal is sent, <span
style='position:relative;top:3.5pt;mso-text-raise:-3.5pt;mso-no-proof:yes'><!--[if gte vml 1]><v:shape
 id="_x0000_i1048" type="#_x0000_t75" style='width:8.25pt;height:13.5pt;
 visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image017.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=11 height=18
src="Project_skeletonCode_files/image018.gif" v:shapes="_x0000_i1048"><![endif]></span><span
style='mso-spacerun:yes'> </span>denotes the time interval between two pulses. <span
style='position:relative;top:3.5pt;mso-text-raise:-3.5pt;mso-no-proof:yes'><!--[if gte vml 1]><v:shape
 id="_x0000_i1047" type="#_x0000_t75" style='width:6pt;height:13.5pt;
 visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image019.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=8 height=18
src="Project_skeletonCode_files/image020.gif" v:shapes="_x0000_i1047"><![endif]></span><span
style='mso-spacerun:yes'> </span>is the time duration of the pulse (pulse
width), <span style='position:relative;top:4.0pt;mso-text-raise:-4.0pt;
mso-no-proof:yes'><!--[if gte vml 1]><v:shape id="_x0000_i1046" type="#_x0000_t75"
 style='width:10.5pt;height:15pt;visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image021.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=14 height=20
src="Project_skeletonCode_files/image022.gif" v:shapes="_x0000_i1046"><![endif]></span><span
style='mso-spacerun:yes'> </span>is the bias and <span style='position:relative;
top:4.0pt;mso-text-raise:-4.0pt;mso-no-proof:yes'><!--[if gte vml 1]><v:shape
 id="_x0000_i1045" type="#_x0000_t75" style='width:9.75pt;height:15pt;
 visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image023.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=13 height=20
src="Project_skeletonCode_files/image024.gif" v:shapes="_x0000_i1045"><![endif]></span><span
style='mso-spacerun:yes'> </span>is the noise.</p>

<p class=Text>First, we use <span style='position:relative;top:4.0pt;
mso-text-raise:-4.0pt;mso-no-proof:yes'><!--[if gte vml 1]><v:shape id="_x0000_i1044"
 type="#_x0000_t75" style='width:75pt;height:15pt;visibility:visible;
 mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image025.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=100 height=20
src="Project_skeletonCode_files/image026.gif" v:shapes="_x0000_i1044"><![endif]></span><span
style='mso-spacerun:yes'> </span>to calculate the interval between two pulse <span
class=GramE>transmissions, and</span> find the average of those values. </p>

<p class=Text>After this value is known, we can find the mean value of <span
style='position:relative;top:4.0pt;mso-text-raise:-4.0pt;mso-no-proof:yes'><!--[if gte vml 1]><v:shape
 id="_x0000_i1043" type="#_x0000_t75" style='width:24.75pt;height:15pt;
 visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image027.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=33 height=20
src="Project_skeletonCode_files/image028.gif" v:shapes="_x0000_i1043"><![endif]></span><span
style='mso-spacerun:yes'> </span>for the first sensor if <span class=GramE>we<span
style='mso-spacerun:yes'>  </span>assume</span> the bias is 0 for this sensor. </p>

<p class=Text><span class=GramE>Next</span> we calculate the mean pulse
interval value for the other sensors without the bias. </p>

<p class=Text>Then we use other sensors' mean value to subtract the first
sensor's mean value to get the bias of each sensor corresponding to the first
sensor.</p>

<div style='mso-element:para-border-div;border:solid #D9D9D9 1.0pt;mso-border-themecolor:
background1;mso-border-themeshade:217;mso-border-alt:solid #D9D9D9 .25pt;
mso-border-themecolor:background1;mso-border-themeshade:217;padding:4.0pt 4.0pt 4.0pt 4.0pt;
background:#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:
242;margin-left:2.85pt;margin-right:0cm'>

<p class=CodeCxSpFirst style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% Speed of sound in air</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>c = 340;<span
style='mso-spacerun:yes'>  </span></span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% Interval between each pulse
transmission in seconds</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>trans_interval=0.5;</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><o:p>&nbsp;</o:p></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% Transpose calibration tphat matrix</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#ED8E13;mso-no-proof:yes'>if </span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>size(tphat,1) ~= 8</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>tphat = tphat';</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#ED8E13;mso-no-proof:yes'>end</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% Transpose measurement tphat matrix</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#ED8E13;mso-no-proof:yes'>if </span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>size(tpyhat,2) ~= 8</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>tpyhat = tpyhat';</span></p>

<p class=CodeCxSpLast style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#ED8E13;mso-no-proof:yes'>end</span></p>

</div>

<p class=Text>Determine error of each sensor:</p>

<div style='mso-element:para-border-div;border:solid #D9D9D9 1.0pt;mso-border-themecolor:
background1;mso-border-themeshade:217;mso-border-alt:solid #D9D9D9 .25pt;
mso-border-themecolor:background1;mso-border-themeshade:217;padding:4.0pt 4.0pt 4.0pt 4.0pt;
background:#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:
242;margin-left:2.85pt;margin-right:0cm'>

<p class=CodeCxSpFirst style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% Get the number of mics and samples</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>[Nmic, Nsample] =
size(tphat); </span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><o:p>&nbsp;</o:p></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% Get the calibration error and
measurement error and estimates</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>[calib_error, ] =
compute_mic_error(tphat,trans_interval,c, false);</span></p>

<p class=CodeCxSpLast style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>[meas_error,
meas_range_est] = compute_mic_error(tpyhat,trans_interval,c, true); </span></p>

</div>

<div style='margin-left:12.75pt'>

<div>

<div uid=BA52E6C7 data-testid="output_0">

<div style='cursor:default'>

<div style='max-width:100%;display:inline-block'>

<div data-dojo-attach-point="graphicsViewNode,backgroundColorNode"
widgetid="uniqName_164_45" id="uniqName_164_45">

<p class=MsoNormal><span style='font-family:Consolas;mso-fareast-font-family:
"Times New Roman";color:#404040;mso-no-proof:yes'><!--[if gte vml 1]><v:shape
 id="Picture_x0020_15" o:spid="_x0000_i1042" type="#_x0000_t75" style='width:351pt;
 height:71.25pt;visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image029.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=468 height=95
src="Project_skeletonCode_files/image030.gif" v:shapes="Picture_x0020_15"><![endif]></span><span
style='font-size:12.0pt;line-height:107%;font-family:Consolas;mso-fareast-font-family:
"Times New Roman";color:#404040'><o:p></o:p></span></p>

</div>

</div>

</div>

</div>

</div>

</div>

<p class=Text>In this model, we assume that the first sensor has zero bias,
this is because when we use the pairwise TDOA method with the first sensor as
the reference sensor, the bias of this sensor can be cancelled and only the
difference between other sensor's bias and the reference sensor's bias is
needed. The plots illustrate some information about the bias and covariance of
noise for each receiver. </p>

<p class=Text>The sensor noise <span class=SpellE>distibutions</span> for the
measurements shown above do not represent a normal distribution, despite the
reference curve applied by the <span class=SpellE>histfit</span> algorithm.</p>

<p class=Text>Perhaps this is a symptom of not collecting enough data to form a
normal distribution. Though the bias of each sensor seems quite close to the
chosen bias of sensor 1.</p>

<div style='mso-element:para-border-div;border:solid #D9D9D9 1.0pt;mso-border-themecolor:
background1;mso-border-themeshade:217;mso-border-alt:solid #D9D9D9 .25pt;
mso-border-themecolor:background1;mso-border-themeshade:217;padding:4.0pt 4.0pt 4.0pt 4.0pt;
background:#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:
242;margin-left:2.85pt;margin-right:0cm'>

<p class=CodeCxSpFirst style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% Compute microphone bias and covariance
of range measurement (m)</span></p>

<p class=CodeCxSpLast style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>[mic_bias,
mic_var] = compute_mic_bias(calib_error);</span></p>

</div>

<p class=Text>The microphone biases are calculated relative to the bias of
sensor 1.</p>

<h1>Task 3.2: Sensor modelling</h1>

<p class=Text>This sensor configuration is what's known as a Time Difference <span
class=GramE>Of</span> Arrival (TDOA) sensor network the arrival time of the
measurement is <span class=SpellE>know</span> - but the broadcast time is not.</p>

<p class=Text>The time of arrival can be modelled as being proportional to the
range (between the sensor and a target) plus some sensor bias.</p>

<p class=Text><span style='position:relative;top:4.0pt;mso-text-raise:-4.0pt;
mso-no-proof:yes'><!--[if gte vml 1]><v:shape id="_x0000_i1041" type="#_x0000_t75"
 style='width:153.75pt;height:15pt;visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image031.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=205 height=20
src="Project_skeletonCode_files/image032.gif" v:shapes="_x0000_i1041"><![endif]></span></p>

<p class=Text>The first sensor network model created is a 2D 8 Sensor TDOA with
a bias state:</p>

<p class=Text><span style='position:relative;top:4.0pt;mso-text-raise:-4.0pt;
mso-no-proof:yes'><!--[if gte vml 1]><v:shape id="_x0000_i1040" type="#_x0000_t75"
 style='width:138.75pt;height:15pt;visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image033.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=185 height=20
src="Project_skeletonCode_files/image034.gif" v:shapes="_x0000_i1040"><![endif]></span></p>

<div style='mso-element:para-border-div;border:solid #D9D9D9 1.0pt;mso-border-themecolor:
background1;mso-border-themeshade:217;mso-border-alt:solid #D9D9D9 .25pt;
mso-border-themecolor:background1;mso-border-themeshade:217;padding:4.0pt 4.0pt 4.0pt 4.0pt;
background:#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:
242;margin-left:2.85pt;margin-right:0cm'>

<p class=CodeCxSpFirst style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% reshape mic locations into a single
row vector</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>th =
reshape(miclocations,1,[]);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% Add a null state to x0, for TDOA with
bias state</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>x0_bias = [x0'
0];</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% Matrix noise sensor covariance, for
TDOA with bias state</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>R_bias =
diag(mic_var);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><o:p>&nbsp;</o:p></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% 8 Sensor TDOA with range offset state</span></p>

<p class=CodeCxSpLast style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>s_tdoa1 =
exsensor(</span><span style='color:#00CC00;mso-no-proof:yes'>'tdoa1'</span><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>,8,1)</span></p>

</div>

<div style='margin-left:12.75pt'>

<div>

<div uid=33783773 data-testid="output_1" data-width=1808 data-height=202
data-hashorizontaloverflow=false style='max-height: 261px'>

<div>

<div>

<p class=MsoNormal><span class=variablenameelement><span style='font-size:9.0pt;
line-height:107%;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
color:#404040'>s_tdoa1 = </span></span><span style='font-size:9.0pt;line-height:
107%;font-family:Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><o:p></o:p></span></p>

</div>

<div>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'>SENSORMOD
object: TDOA1 with range offset state<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>/ sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(1)).^2+(x(2,:)-<span class=SpellE>th</span>(2)).^2) +
x(3,:)<span style='mso-spacerun:yes'>   </span>\<span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(3)).^2+(x(2,:)-<span class=SpellE>th</span>(4)).^2) +
x(3,:)<span style='mso-spacerun:yes'>   </span>|<span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(5)).^2+(x(2,:)-<span class=SpellE>th</span>(6)).^2) +
x(3,:)<span style='mso-spacerun:yes'>   </span>|<span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(7)).^2+(x(2,:)-<span class=SpellE>th</span>(8)).^2) +
x(3,:)<span style='mso-spacerun:yes'>   </span>|<span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>   </span>y = | sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(9)).^2+(x(2,:)-<span class=SpellE>th</span>(10)).^2) +
x(3,:)<span style='mso-spacerun:yes'>  </span>| + e<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(11)).^2+(x(2,:)-<span class=SpellE>th</span>(12)).^2) +
x(3,:) |<span style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(13)).^2+(x(2,:)-<span class=SpellE>th</span>(14)).^2) +
x(3,:) |<span style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>\ sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(15)).^2+(x(2,:)-<span class=SpellE>th</span>(16)).^2) +
x(3,:) /<span style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>   </span>x0<span class=GramE>'<span
style='mso-spacerun:yes'>  </span>=</span> [0.94,0.96,0.58]<span
style='mso-spacerun:yes'>  </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>   </span><span class=SpellE>th</span><span
class=GramE>'<span style='mso-spacerun:yes'>  </span>=</span>
[0.06,0.23,0.35,0.82,0.015,0.043,0.17,0.65,0.73,0.65,0.45,0.55,0.3,0.74,0.19,0.69]<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>  </span>States:<span style='mso-spacerun:yes'> 
</span>x1<span style='mso-spacerun:yes'>     </span>x2<span
style='mso-spacerun:yes'>     </span>x3<span style='mso-spacerun:yes'>    
</span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>  </span>Outputs: y1<span
style='mso-spacerun:yes'>     </span>y2<span style='mso-spacerun:yes'>    
</span>y3<span style='mso-spacerun:yes'>     </span>y4<span
style='mso-spacerun:yes'>     </span>y5<span style='mso-spacerun:yes'>    
</span>y6<span style='mso-spacerun:yes'>     </span>y7<span
style='mso-spacerun:yes'>     </span>y8<span style='mso-spacerun:yes'>    
</span><o:p></o:p></span></p>

</div>

</div>

</div>

</div>

</div>

<div style='mso-element:para-border-div;border:solid #D9D9D9 1.0pt;mso-border-themecolor:
background1;mso-border-themeshade:217;mso-border-alt:solid #D9D9D9 .25pt;
mso-border-themecolor:background1;mso-border-themeshade:217;padding:4.0pt 4.0pt 4.0pt 4.0pt;
background:#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:
242;margin-left:2.85pt;margin-right:0cm'>

<p class=CodeCxSpFirst style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% Assign TDOA sensor network inputs</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>s_tdoa1.th = th;</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>s_tdoa1.x0 =
x0_bias;</span></p>

<p class=CodeCxSpLast style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>s_tdoa1.pe =
R_bias;</span></p>

</div>

<p class=Text>The second sensor network model created is a 2D, 8 Sensor TDOA
with pairwise differences:</p>

<p class=Text><span style='position:relative;top:4.0pt;mso-text-raise:-4.0pt;
mso-no-proof:yes'><!--[if gte vml 1]><v:shape id="_x0000_i1039" type="#_x0000_t75"
 style='width:162.75pt;height:15pt;visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image035.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=217 height=20
src="Project_skeletonCode_files/image036.gif" v:shapes="_x0000_i1039"><![endif]></span></p>

<p class=Text>This pairwise network intends to utilise the differences in
measurement arrival times to compute the differences in distance, between the
paired sensors and the target.</p>

<div style='mso-element:para-border-div;border:solid #D9D9D9 1.0pt;mso-border-themecolor:
background1;mso-border-themeshade:217;mso-border-alt:solid #D9D9D9 .25pt;
mso-border-themecolor:background1;mso-border-themeshade:217;padding:4.0pt 4.0pt 4.0pt 4.0pt;
background:#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:
242;margin-left:2.85pt;margin-right:0cm'>

<p class=CodeCxSpFirst style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% 8 Sensor TDOA with pairwise
differences</span></p>

<p class=CodeCxSpLast style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>s_tdoa2 =
exsensor(</span><span style='color:#00CC00;mso-no-proof:yes'>'tdoa2'</span><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>,8,1)</span></p>

</div>

<div style='margin-left:12.75pt'>

<div>

<div uid=E40293B0 data-testid="output_2" data-width=1808 data-height=874
data-hashorizontaloverflow=false style='max-height: 261px' data-scroll-top=600
data-scroll-left=0>

<div>

<div>

<p class=MsoNormal><span class=variablenameelement><span style='font-size:9.0pt;
line-height:107%;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
color:#404040'>s_tdoa2 = </span></span><span style='font-size:9.0pt;line-height:
107%;font-family:Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><o:p></o:p></span></p>

</div>

<div>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'>SENSORMOD
object: TDOA2 with pairwise differences<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>/ sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(1)).^2+(x(2,:)-<span class=SpellE>th</span>(2)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(3)).^2+(x(2,:)-<span class=SpellE>th</span>(4)).^2)<span
style='mso-spacerun:yes'>     </span>\<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(1)).^2+(x(2,:)-<span class=SpellE>th</span>(2)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(5)).^2+(x(2,:)-<span class=SpellE>th</span>(6)).^2)<span
style='mso-spacerun:yes'>     </span>|<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(1)).^2+(x(2,:)-<span class=SpellE>th</span>(2)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(7)).^2+(x(2,:)-<span class=SpellE>th</span>(8)).^2)<span
style='mso-spacerun:yes'>     </span>|<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(1)).^2+(x(2,:)-<span class=SpellE>th</span>(2)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(9)).^2+(x(2,:)-<span class=SpellE>th</span>(10)).^2)<span
style='mso-spacerun:yes'>    </span>|<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(1)).^2+(x(2,:)-<span class=SpellE>th</span>(2)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(11)).^2+(x(2,:)-<span class=SpellE>th</span>(12)).^2)<span
style='mso-spacerun:yes'>   </span>|<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(1)).^2+(x(2,:)-<span class=SpellE>th</span>(2)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(13)).^2+(x(2,:)-<span class=SpellE>th</span>(14)).^2)<span
style='mso-spacerun:yes'>   </span>|<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(1)).^2+(x(2,:)-<span class=SpellE>th</span>(2)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(15)).^2+(x(2,:)-<span class=SpellE>th</span>(16)).^2)<span
style='mso-spacerun:yes'>   </span>|<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(3)).^2+(x(2,:)-<span class=SpellE>th</span>(4)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(5)).^2+(x(2,:)-<span class=SpellE>th</span>(6)).^2)<span
style='mso-spacerun:yes'>     </span>|<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(3)).^2+(x(2,:)-<span class=SpellE>th</span>(4)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(7)).^2+(x(2,:)-<span class=SpellE>th</span>(8)).^2)<span
style='mso-spacerun:yes'>     </span>|<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(3)).^2+(x(2,:)-<span class=SpellE>th</span>(4)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(9)).^2+(x(2,:)-<span class=SpellE>th</span>(10)).^2)<span
style='mso-spacerun:yes'>    </span>|<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(3)).^2+(x(2,:)-<span class=SpellE>th</span>(4)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(11)).^2+(x(2,:)-<span class=SpellE>th</span>(12)).^2)<span
style='mso-spacerun:yes'>   </span>|<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(3)).^2+(x(2,:)-<span class=SpellE>th</span>(4)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(13)).^2+(x(2,:)-<span class=SpellE>th</span>(14)).^2)<span
style='mso-spacerun:yes'>   </span>|<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(3)).^2+(x(2,:)-<span class=SpellE>th</span>(4)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(15)).^2+(x(2,:)-<span class=SpellE>th</span>(16)).^2)<span
style='mso-spacerun:yes'>   </span>|<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(5)).^2+(x(2,:)-<span class=SpellE>th</span>(6)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(7)).^2+(x(2,:)-<span class=SpellE>th</span>(8)).^2)<span
style='mso-spacerun:yes'>     </span>|<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>   </span>y = | sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(5)).^2+(x(2,:)-<span class=SpellE>th</span>(6)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(9)).^2+(x(2,:)-<span class=SpellE>th</span>(10)).^2)<span
style='mso-spacerun:yes'>    </span>|<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(5)).^2+(x(2,:)-<span class=SpellE>th</span>(6)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(11)).^2+(x(2,:)-<span class=SpellE>th</span>(12)).^2)<span
style='mso-spacerun:yes'>   </span>|<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(5)).^2+(x(2,:)-<span class=SpellE>th</span>(6)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(13)).^2+(x(2,:)-<span class=SpellE>th</span>(14)).^2)<span
style='mso-spacerun:yes'>   </span>|<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(5)).^2+(x(2,:)-<span class=SpellE>th</span>(6)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(15)).^2+(x(2,:)-<span class=SpellE>th</span>(16)).^2)<span
style='mso-spacerun:yes'>   </span>|<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(7)).^2+(x(2,:)-<span class=SpellE>th</span>(8)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(9)).^2+(x(2,:)-<span class=SpellE>th</span>(10)).^2)<span
style='mso-spacerun:yes'>    </span>|<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(7)).^2+(x(2,:)-<span class=SpellE>th</span>(8)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(11)).^2+(x(2,:)-<span class=SpellE>th</span>(12)).^2)<span
style='mso-spacerun:yes'>   </span>|<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(7)).^2+(x(2,:)-<span class=SpellE>th</span>(8)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(13)).^2+(x(2,:)-<span class=SpellE>th</span>(14)).^2)<span
style='mso-spacerun:yes'>   </span>|<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(7)).^2+(x(2,:)-<span class=SpellE>th</span>(8)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(15)).^2+(x(2,:)-<span class=SpellE>th</span>(16)).^2)<span
style='mso-spacerun:yes'>   </span>|<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(9)).^2+(x(2,:)-<span class=SpellE>th</span>(10)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(11)).^2+(x(2,:)-<span class=SpellE>th</span>(12)).^2)<span
style='mso-spacerun:yes'>  </span>|<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(9)).^2+(x(2,:)-<span class=SpellE>th</span>(10)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(13)).^2+(x(2,:)-<span class=SpellE>th</span>(14)).^2)<span
style='mso-spacerun:yes'>  </span>|<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(9)).^2+(x(2,:)-<span class=SpellE>th</span>(10)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(15)).^2+(x(2,:)-<span class=SpellE>th</span>(16)).^2)<span
style='mso-spacerun:yes'>  </span>|<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(11)).^2+(x(2,:)-<span class=SpellE>th</span>(12)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(13)).^2+(x(2,:)-<span class=SpellE>th</span>(14)).^2)
|<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>| sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(11)).^2+(x(2,:)-<span class=SpellE>th</span>(12)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(15)).^2+(x(2,:)-<span class=SpellE>th</span>(16)).^2)
|<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>       </span>\ sqrt((x(<span class=GramE>1,:)</span>-<span
class=SpellE>th</span>(13)).^2+(x(2,:)-<span class=SpellE>th</span>(14)).^2) -
sqrt((x(1,:)-<span class=SpellE>th</span>(15)).^2+(x(2,:)-<span class=SpellE>th</span>(16)).^2)
/<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'> </span>+ e<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>    </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>   </span>x0<span class=GramE>'<span
style='mso-spacerun:yes'>  </span>=</span> [0.18,0.9]<span
style='mso-spacerun:yes'>  </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>   </span><span class=SpellE>th</span><span
class=GramE>'<span style='mso-spacerun:yes'>  </span>=</span>
[0.98,0.44,0.11,0.26,0.41,0.59,0.26,0.6,0.71,0.22,0.12,0.3,0.32,0.42,0.51,0.086]<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>  </span>States:<span style='mso-spacerun:yes'> 
</span>x1<span style='mso-spacerun:yes'>     </span>x2<span
style='mso-spacerun:yes'>     </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>  </span>Outputs: y1<span
style='mso-spacerun:yes'>     </span>y2<span style='mso-spacerun:yes'>    
</span>y3<span style='mso-spacerun:yes'>     </span>y4<span
style='mso-spacerun:yes'>     </span>y5<span style='mso-spacerun:yes'>    
</span>y6<span style='mso-spacerun:yes'>     </span>y7<span
style='mso-spacerun:yes'>     </span>y8<span style='mso-spacerun:yes'>    
</span>y9 <span style='mso-spacerun:yes'>    </span>y10<span
style='mso-spacerun:yes'>     </span>y11<span style='mso-spacerun:yes'>    
</span>y12<span style='mso-spacerun:yes'>     </span>y13<span
style='mso-spacerun:yes'>     </span>y14<span style='mso-spacerun:yes'>    
</span>y15<span style='mso-spacerun:yes'>     </span>y16<span
style='mso-spacerun:yes'>     </span>y17<span style='mso-spacerun:yes'>    
</span>y18<span style='mso-spacerun:yes'>     </span>y19<span
style='mso-spacerun:yes'>     </span>y20<span style='mso-spacerun:yes'>    
</span>y21<span style='mso-spacerun:yes'>     </span>y22<span
style='mso-spacerun:yes'>     </span>y23<span style='mso-spacerun:yes'>    
</span>y24<span style='mso-spacerun:yes'>     </span>y25<span
style='mso-spacerun:yes'>     </span>y26<span style='mso-spacerun:yes'>    
</span>y27<span style='mso-spacerun:yes'>     </span>y28<span
style='mso-spacerun:yes'>     </span><o:p></o:p></span></p>

</div>

</div>

</div>

</div>

</div>

<div style='mso-element:para-border-div;border:solid #D9D9D9 1.0pt;mso-border-themecolor:
background1;mso-border-themeshade:217;mso-border-alt:solid #D9D9D9 .25pt;
mso-border-themecolor:background1;mso-border-themeshade:217;padding:4.0pt 4.0pt 4.0pt 4.0pt;
background:#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:
242;margin-left:2.85pt;margin-right:0cm'>

<p class=CodeCxSpFirst style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><o:p>&nbsp;</o:p></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% Matrix of pairwise differences of
noise sensor covariance, for TDOA as range differences</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>var_range =
get_pairwise_diff_covar(s_tdoa2.nn(3), Nmic, mic_var);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><o:p>&nbsp;</o:p></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% Assign TDOA sensor network inputs</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>s_tdoa2.th = th;</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>s_tdoa2.x0 = x0';</span></p>

<p class=CodeCxSpLast style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>s_tdoa2.pe =
diag(var_range);</span></p>

</div>

<h1>Task 3.3: Experiments</h1>

<p class=Text>The microphones are set up to have multiple diverse points of
measurement to ensure a robust network, accounting for real world bias and
error.</p>

<p class=Text>The bias is removed from each measurement, using the relative
bias calculated in Task <span class=GramE>3.1:Calibration</span> step. The bias
of each sensor is directly subtracted from each measurement from that sensor.</p>

<p class=Text>The pairwise differences for the measurements and the covariance
matrix are calculated in a similar fashion to <span class=SpellE>eachother</span>.</p>

<p class=Text><span style='position:relative;top:29.0pt;mso-text-raise:-29.0pt;
mso-no-proof:yes'><!--[if gte vml 1]><v:shape id="_x0000_i1038" type="#_x0000_t75"
 style='width:230.25pt;height:67.5pt;visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image037.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=307 height=90
src="Project_skeletonCode_files/image038.gif" v:shapes="_x0000_i1038"><![endif]></span></p>

<p class=Text>Where <span style='position:relative;top:4.0pt;mso-text-raise:
-4.0pt;mso-no-proof:yes'><!--[if gte vml 1]><v:shape id="_x0000_i1037" type="#_x0000_t75"
 style='width:20.25pt;height:15pt;visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image039.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=27 height=20
src="Project_skeletonCode_files/image040.gif" v:shapes="_x0000_i1037"><![endif]></span><span
style='mso-spacerun:yes'>  </span>is the pairwise difference measurements or
variance, <span style='position:relative;top:3.5pt;mso-text-raise:-3.5pt;
mso-no-proof:yes'><!--[if gte vml 1]><v:shape id="_x0000_i1036" type="#_x0000_t75"
 style='width:8.25pt;height:13.5pt;visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image041.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=11 height=18
src="Project_skeletonCode_files/image042.gif" v:shapes="_x0000_i1036"><![endif]></span><span
style='mso-spacerun:yes'> </span>is the original measurement or variance, m is
the number of measurements or variance &amp; n of sensors.</p>

<div style='mso-element:para-border-div;border:solid #D9D9D9 1.0pt;mso-border-themecolor:
background1;mso-border-themeshade:217;mso-border-alt:solid #D9D9D9 .25pt;
mso-border-themecolor:background1;mso-border-themeshade:217;padding:4.0pt 4.0pt 4.0pt 4.0pt;
background:#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:
242;margin-left:2.85pt;margin-right:0cm'>

<p class=CodeCxSpFirst style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% Remove bias from the measurements</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>unbiased_range_est
= remove_meas_bias(meas_range_est, mic_bias);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><o:p>&nbsp;</o:p></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% Get the pairwise differences of
detection times</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>meas_range_diff =
get_pairwise_diff_meas(unbiased_range_est, s_tdoa2.nn(3), Nmic);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><o:p>&nbsp;</o:p></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% Create signals for each TDOA network,
based on measurement estimates</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>tdoa1_sig =
sig(meas_range_est,2);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>tdoa2_sig =
sig(meas_range_diff,2);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><o:p>&nbsp;</o:p></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>figure;</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>plot(s_tdoa1)</span></p>

<p class=CodeCxSpLast style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>title(</span><span
style='color:#00CC00;mso-no-proof:yes'>&quot;Sensor network distribution and
target location&quot;</span><span style='color:black;mso-color-alt:windowtext;
mso-no-proof:yes'>)</span></p>

</div>

<div style='margin-left:12.75pt'>

<div>

<div uid=C8613A94 data-testid="output_3">

<div style='cursor:default'>

<div style='max-width:100%;display:inline-block'>

<div data-dojo-attach-point="graphicsViewNode,backgroundColorNode"
widgetid="uniqName_164_48" id="uniqName_164_48">

<p class=MsoNormal><span style='font-family:Consolas;mso-fareast-font-family:
"Times New Roman";color:#404040;mso-no-proof:yes'><!--[if gte vml 1]><v:shape
 id="Picture_x0020_22" o:spid="_x0000_i1035" type="#_x0000_t75" style='width:315pt;
 height:236.25pt;visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image043.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=420 height=315
src="Project_skeletonCode_files/image044.gif" v:shapes="Picture_x0020_22"><![endif]></span><span
style='font-size:12.0pt;line-height:107%;font-family:Consolas;mso-fareast-font-family:
"Times New Roman";color:#404040'><o:p></o:p></span></p>

</div>

</div>

</div>

</div>

</div>

</div>

<p class=Text>The above graphic is a representation of the sensor network
(S1-S8) around the starting point of the target (T1).</p>

<h1>Task 3.4: Configuration analysis</h1>

<p class=Text><b style='mso-bidi-font-weight:normal'><i style='mso-bidi-font-style:
normal'>Layout configuration is analysed for the CRLB.</i></b></p>

<p class=Text>The Cramer-Rao Lower Bound (CRLB) is a method of getting the
lower bound for the variance of an unbiased estimator.</p>

<p class=Text><span style='position:relative;top:4.0pt;mso-text-raise:-4.0pt;
mso-no-proof:yes'><!--[if gte vml 1]><v:shape id="_x0000_i1034" type="#_x0000_t75"
 style='width:93.75pt;height:15.75pt;visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image045.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=125 height=21
src="Project_skeletonCode_files/image046.gif" v:shapes="_x0000_i1034"><![endif]></span><span
style='mso-spacerun:yes'> </span></p>

<p class=Text>The value of the CRLB gives the user the minimum variance that
can be expected when using that estimator - the lower the better.</p>

<div style='mso-element:para-border-div;border:solid #D9D9D9 1.0pt;mso-border-themecolor:
background1;mso-border-themeshade:217;mso-border-alt:solid #D9D9D9 .25pt;
mso-border-themecolor:background1;mso-border-themeshade:217;padding:4.0pt 4.0pt 4.0pt 4.0pt;
background:#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:
242;margin-left:2.85pt;margin-right:0cm'>

<p class=CodeCxSpFirst style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>index =
[-90:5:90];</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>subplot(1,2,1)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>hold </span><span
style='color:#00CC00;mso-no-proof:yes'>on</span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>;</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>crlb2(s_tdoa1,[],index,index);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>plot(s_tdoa1)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>title(</span><span
style='color:#00CC00;mso-no-proof:yes'>&quot;2D TDOA with bias state (crlb,
sensor and target locations)&quot;</span><span style='color:black;mso-color-alt:
windowtext;mso-no-proof:yes'>);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><o:p>&nbsp;</o:p></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>subplot(1,2,2)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>crlb2(s_tdoa2,[],index,index);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>plot(s_tdoa2)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>title(</span><span
style='color:#00CC00;mso-no-proof:yes'>&quot;2D TDOA with range state (crlb,
sensor and target locations)&quot;</span><span style='color:black;mso-color-alt:
windowtext;mso-no-proof:yes'>);</span></p>

<p class=CodeCxSpLast style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>hold </span><span
style='color:#00CC00;mso-no-proof:yes'>off</span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>;</span></p>

</div>

<div style='margin-left:12.75pt'>

<div>

<div uid=3C476386 data-testid="output_4">

<div style='cursor:default'>

<div style='max-width:100%;display:inline-block'>

<div data-dojo-attach-point="graphicsViewNode,backgroundColorNode"
widgetid="uniqName_164_57" id="uniqName_164_57">

<p class=MsoNormal><span style='font-family:Consolas;mso-fareast-font-family:
"Times New Roman";color:#404040;mso-no-proof:yes'><!--[if gte vml 1]><v:shape
 id="Picture_x0020_24" o:spid="_x0000_i1033" type="#_x0000_t75" style='width:351pt;
 height:71.25pt;visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image047.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=468 height=95
src="Project_skeletonCode_files/image048.gif" v:shapes="Picture_x0020_24"><![endif]></span><span
style='font-size:12.0pt;line-height:107%;font-family:Consolas;mso-fareast-font-family:
"Times New Roman";color:#404040'><o:p></o:p></span></p>

</div>

</div>

</div>

</div>

</div>

</div>

<p class=Text>As can be seen above, the contour plot of the CRLB was computed
for each sensor network, TDOA with bias state &amp; TDOA with range state.</p>

<p class=Text>The CRLB value for TDOA network with range state is lower at all
points than in the <span class=SpellE>the</span> TDOA with bias state. This
would imply a lower bound for variance for the former - thus less possible
variance for TDOA with range state.</p>

<h1>Task 3.5: Localization</h1>

<p class=Text>The microphone data measured from the virtual lab was 'snapshot'
localised first, comparing TDOA with bias state &amp; TDOA with range state
networks.</p>

<div style='mso-element:para-border-div;border:solid #D9D9D9 1.0pt;mso-border-themecolor:
background1;mso-border-themeshade:217;mso-border-alt:solid #D9D9D9 .25pt;
mso-border-themecolor:background1;mso-border-themeshade:217;padding:4.0pt 4.0pt 4.0pt 4.0pt;
background:#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:
242;margin-left:2.85pt;margin-right:0cm'>

<p class=CodeCxSpFirst style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>%Testing the measured data using WLS</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>[xhat1,shat1] =
wls(s_tdoa1, tdoa1_sig);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>[xhat2,shat2] =
wls(s_tdoa2, tdoa2_sig);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% Plot of the TDOA1 % TDOA2 WLS results
vs the true track</span></p>

<p class=CodeCxSpLast style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>plot_wls_vs_track(xhat1,
xhat2);</span></p>

</div>

<div style='margin-left:12.75pt'>

<div>

<div uid=D4FC0EE4 data-testid="output_5">

<div style='cursor:default'>

<div style='max-width:100%;display:inline-block'>

<div data-dojo-attach-point="graphicsViewNode,backgroundColorNode"
widgetid="uniqName_164_93" id="uniqName_164_93">

<p class=MsoNormal><span style='font-family:Consolas;mso-fareast-font-family:
"Times New Roman";color:#404040;mso-no-proof:yes'><!--[if gte vml 1]><v:shape
 id="Picture_x0020_25" o:spid="_x0000_i1032" type="#_x0000_t75" style='width:351pt;
 height:117pt;visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image049.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=468 height=156
src="Project_skeletonCode_files/image050.gif" v:shapes="Picture_x0020_25"><![endif]></span><span
style='font-size:12.0pt;line-height:107%;font-family:Consolas;mso-fareast-font-family:
"Times New Roman";color:#404040'><o:p></o:p></span></p>

</div>

</div>

</div>

</div>

</div>

</div>

<p class=Text>As can be seen from the graphs above the original data was
unsuitable to be used to localise and track the movement of a vehicle through <span
class=SpellE>through</span> the network. When compared to the shape of the
&quot;true&quot; track on the right deviations can be seen in both sensor
networks.</p>

<p class=Text>This is due to random &quot;jumps&quot; in the measured data,
where microphones would skip readings, only to re-align themselves several
readings later.</p>

<p class=Text><span class=GramE>This errors</span> accumulated and caused the
loss in fidelity which can be seen above.</p>

<p class=Text>To attenuate this issue generated data was introduced to simulate
measurements the microphone sensor network.</p>

<p class=Text><o:p>&nbsp;</o:p></p>

<p class=Text>A snapshot localisation for weighted least squares (WLS)
approach:</p>

<p class=Text><span style='position:relative;top:3.5pt;mso-text-raise:-3.5pt;
mso-no-proof:yes'><!--[if gte vml 1]><v:shape id="_x0000_i1031" type="#_x0000_t75"
 style='width:217.5pt;height:15pt;visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image051.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=290 height=20
src="Project_skeletonCode_files/image052.gif" v:shapes="_x0000_i1031"><![endif]></span></p>

<p class=Text>WLS is a linear regression model, used here to estimate a
location value based on the microphone measurements and a sensor network model.</p>

<div style='mso-element:para-border-div;border:solid #D9D9D9 1.0pt;mso-border-themecolor:
background1;mso-border-themeshade:217;mso-border-alt:solid #D9D9D9 .25pt;
mso-border-themecolor:background1;mso-border-themeshade:217;padding:4.0pt 4.0pt 4.0pt 4.0pt;
background:#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:
242;margin-left:2.85pt;margin-right:0cm'>

<p class=CodeCxSpFirst style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% generate noisy range data for these
sections</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>gen_sig =
sig(gen_y,2);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><o:p>&nbsp;</o:p></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% Calculate the WLS for TDOA network 1</span></p>

<p class=CodeCxSpLast style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>xhat_wls1 =
wls(s_tdoa1, gen_sig)</span></p>

</div>

<div style='margin-left:12.75pt'>

<div>

<div uid=9CA62A0B data-testid="output_6" data-width=1808 data-height=76
data-hashorizontaloverflow=false style='max-height: 261px'>

<div>

<div>

<p class=MsoNormal><span class=variablenameelement><span style='font-size:9.0pt;
line-height:107%;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
color:#404040'>xhat_wls1 = </span></span><span style='font-size:9.0pt;
line-height:107%;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
color:#404040'><o:p></o:p></span></p>

</div>

<div>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'>SIG object
with continuous time stochastic state space data (no input)<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>  </span>Sizes:<span style='mso-spacerun:yes'>      
</span>N = <span class=GramE>74,<span style='mso-spacerun:yes'>  </span><span
class=SpellE>ny</span></span> = 8, <span class=SpellE>nx</span> = 3<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>  </span>MC is set to: <span class=GramE>30</span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>  </span>#MC samples:<span style='mso-spacerun:yes'> 
</span>0<o:p></o:p></span></p>

</div>

</div>

</div>

</div>

</div>

<div style='mso-element:para-border-div;border:solid #D9D9D9 1.0pt;mso-border-themecolor:
background1;mso-border-themeshade:217;mso-border-alt:solid #D9D9D9 .25pt;
mso-border-themecolor:background1;mso-border-themeshade:217;padding:4.0pt 4.0pt 4.0pt 4.0pt;
background:#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:
242;margin-left:2.85pt;margin-right:0cm'>

<p class=CodeCxSpFirst style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% Plot the setup WLS for TDOA 1. </span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>subplot(1,2,1)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>xplot2(xhat_wls1,</span><span
style='color:#00CC00;mso-no-proof:yes'>'conf'</span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>,90);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>hold </span><span
style='color:#00CC00;mso-no-proof:yes'>on</span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>;</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>plot(s_tdoa1);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>t1 = title(</span><span
style='color:#00CC00;mso-no-proof:yes'>&quot;WLS TDOA1 snapshot localisation,
with 90% confidence&quot;</span><span style='color:black;mso-color-alt:windowtext;
mso-no-proof:yes'>);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>set(t1,</span><span
style='color:#00CC00;mso-no-proof:yes'>'position'</span><span style='color:
black;mso-color-alt:windowtext;mso-no-proof:yes'>,[0 64 0])</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>hold </span><span
style='color:#00CC00;mso-no-proof:yes'>off</span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>;</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>camroll(-180);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><o:p>&nbsp;</o:p></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% Calculate the pariwise differences of
the generated data</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>gen_pair =
get_pairwise_diff_meas(gen_y, s_tdoa2.nn(3), Nmic);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>gen_pair_sig =
sig(gen_pair,2);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><o:p>&nbsp;</o:p></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% Calculate the WLS for TDOA network 2</span></p>

<p class=CodeCxSpLast style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>xhat_wls2 =
wls(s_tdoa2,gen_pair_sig)</span></p>

</div>

<div style='margin-left:12.75pt'>

<div>

<div uid=7DB7E6A2 data-testid="output_7" data-width=1808 data-height=76
data-hashorizontaloverflow=false style='max-height: 261px'>

<div>

<div>

<p class=MsoNormal><span class=variablenameelement><span style='font-size:9.0pt;
line-height:107%;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
color:#404040'>xhat_wls2 = </span></span><span style='font-size:9.0pt;
line-height:107%;font-family:Consolas;mso-fareast-font-family:"Times New Roman";
color:#404040'><o:p></o:p></span></p>

</div>

<div>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'>SIG object
with continuous time stochastic state space data (no input)<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>  </span>Sizes:<span style='mso-spacerun:yes'>      
</span>N = <span class=GramE>74,<span style='mso-spacerun:yes'>  </span><span
class=SpellE>ny</span></span> = 28, <span class=SpellE>nx</span> = 2<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>  </span>MC is set to: <span class=GramE>30</span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:9.0pt;line-height:107%;font-family:
Consolas;mso-fareast-font-family:"Times New Roman";color:#404040'><span
style='mso-spacerun:yes'>  </span>#MC samples:<span style='mso-spacerun:yes'> 
</span>0<o:p></o:p></span></p>

</div>

</div>

</div>

</div>

</div>

<div style='mso-element:para-border-div;border:solid #D9D9D9 1.0pt;mso-border-themecolor:
background1;mso-border-themeshade:217;mso-border-alt:solid #D9D9D9 .25pt;
mso-border-themecolor:background1;mso-border-themeshade:217;padding:4.0pt 4.0pt 4.0pt 4.0pt;
background:#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:
242;margin-left:2.85pt;margin-right:0cm'>

<p class=CodeCxSpFirst style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% Plot the setup WLS for TDOA 2. </span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>subplot(1,2,2)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>hold </span><span
style='color:#00CC00;mso-no-proof:yes'>on</span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>;</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>xplot2(xhat_wls2,</span><span
style='color:#00CC00;mso-no-proof:yes'>'conf'</span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>, 90)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>plot(s_tdoa2);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>set(gcf, </span><span
style='color:#00CC00;mso-no-proof:yes'>'Position'</span><span style='color:
black;mso-color-alt:windowtext;mso-no-proof:yes'>,[100 100 1500 500])</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>t2 = title(</span><span
style='color:#00CC00;mso-no-proof:yes'>&quot;WLS TDOA2 snapshot localisation,
with 90% confidence&quot;</span><span style='color:black;mso-color-alt:windowtext;
mso-no-proof:yes'>);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>set(t2,</span><span
style='color:#00CC00;mso-no-proof:yes'>'position'</span><span style='color:
black;mso-color-alt:windowtext;mso-no-proof:yes'>,[0 64 0])</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>hold </span><span
style='color:#00CC00;mso-no-proof:yes'>off</span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>;</span></p>

<p class=CodeCxSpLast style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>camroll(-180);</span></p>

</div>

<div style='margin-left:12.75pt'>

<div>

<div uid=621D9ED4 data-testid="output_8">

<div style='cursor:default'>

<div style='max-width:100%;display:inline-block'>

<div data-dojo-attach-point="graphicsViewNode,backgroundColorNode"
widgetid="uniqName_164_219" id="uniqName_164_219">

<p class=MsoNormal><span style='font-family:Consolas;mso-fareast-font-family:
"Times New Roman";color:#404040;mso-no-proof:yes'><!--[if gte vml 1]><v:shape
 id="Picture_x0020_27" o:spid="_x0000_i1030" type="#_x0000_t75" style='width:351pt;
 height:117pt;visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image053.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=468 height=156
src="Project_skeletonCode_files/image054.gif" v:shapes="Picture_x0020_27"><![endif]></span><span
style='font-size:12.0pt;line-height:107%;font-family:Consolas;mso-fareast-font-family:
"Times New Roman";color:#404040'><o:p></o:p></span></p>

</div>

</div>

</div>

</div>

</div>

</div>

<p class=Text>As can be seen above the confidence boundaries for the TDOA
network 2 (with range state) are smaller than for the TDOA network 1 (with bias
state).</p>

<p class=Text>This would imply that the TDOA network 2 is more confident of the
position of the target at each timestep.</p>

<p class=Text>In <span class=GramE>general</span> the WLS estimator for the
snapshot localisation worked remarkably well. Tracking the true progress of the
vehicle to high degree.</p>

<p class=Text><o:p>&nbsp;</o:p></p>

<p class=Text><b style='mso-bidi-font-weight:normal'>Sidenote:</b> I struggled
immensely to get another NL model working for snapshot localisation. I've been
attempting this for the last week now, trying different inputs &amp; syntax to
no avail. I asked some of my classmates for help, but they were similarly
struggling or busy. This technical issue really marred the end of my project.
My apologies, Marion.</p>

<h1>Task 6: Tracking</h1>

<p class=Text>Create two motion models: Cartesian velocity linear model in 2D
(CV2D) &amp; <span class=GramE>Dead-reckoning</span> of acceleration and yaw
rate.</p>

<p class=Text>CV2D is a constant velocity model. This model assumed a
continuous linear <span class=SpellE>volocity</span> over time, it is a simple
motion model.</p>

<p class=Text>A <span class=GramE>dead-reckoning</span> of acceleration and yaw
rate motion model assumes an object moves via a combination of linear
acceleration and angular velocity.</p>

<p class=Text>The models are created and merged with existing sensor <span
class=GramE>networks</span></p>

<div style='mso-element:para-border-div;border:solid #D9D9D9 1.0pt;mso-border-themecolor:
background1;mso-border-themeshade:217;mso-border-alt:solid #D9D9D9 .25pt;
mso-border-themecolor:background1;mso-border-themeshade:217;padding:4.0pt 4.0pt 4.0pt 4.0pt;
background:#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:
242;margin-left:2.85pt;margin-right:0cm'>

<p class=CodeCxSpFirst style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>%code and explanations for (a) here</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>mm1 = exmotion(</span><span
style='color:#00CC00;mso-no-proof:yes'>'cv2d'</span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>mms1 =
addsensor(mm1,s_tdoa1);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><o:p>&nbsp;</o:p></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>mm2 = exmotion(</span><span
style='color:#00CC00;mso-no-proof:yes'>'imu2d'</span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>);</span></p>

<p class=CodeCxSpLast style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>mms2 =
addsensor(mm2,s_tdoa2);</span></p>

</div>

<p class=Text>Apply the Extended Kalman Filter (EKF) to the models, using the
localisation estimates from the last section as measurements.</p>

<p class=Text>The EKF is performed in two sections, the Prediction stage:</p>

<p class=Text><span style='position:relative;top:4.0pt;mso-text-raise:-4.0pt;
mso-no-proof:yes'><!--[if gte vml 1]><v:shape id="_x0000_i1029" type="#_x0000_t75"
 style='width:77.25pt;height:16.5pt;visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image055.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=103 height=22
src="Project_skeletonCode_files/image056.gif" v:shapes="_x0000_i1029"><![endif]></span></p>

<p class=Text><span style='position:relative;top:7.0pt;mso-text-raise:-7.0pt;
mso-no-proof:yes'><!--[if gte vml 1]><v:shape id="_x0000_i1028" type="#_x0000_t75"
 style='width:262.5pt;height:18.75pt;visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image057.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=350 height=25
src="Project_skeletonCode_files/image058.gif" v:shapes="_x0000_i1028"><![endif]></span></p>

<p class=Text>And the Update <span class=GramE>stage :</span> The <span
class=SpellE>Innocation</span> covariance is calculated, the optimal Kalman
gain is computed, the Corrected estimation is updated &amp; the Covariance is
updated.</p>

<p class=Text><span style='position:relative;top:42.0pt;mso-text-raise:-42.0pt;
mso-no-proof:yes'><!--[if gte vml 1]><v:shape id="Untitled" o:spid="_x0000_i1027"
 type="#_x0000_t75" style='width:286.5pt;height:93pt;visibility:visible;
 mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image059.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=382 height=124
src="Project_skeletonCode_files/image060.gif" v:shapes="Untitled"><![endif]></span></p>

<div style='mso-element:para-border-div;border:solid #D9D9D9 1.0pt;mso-border-themecolor:
background1;mso-border-themeshade:217;mso-border-alt:solid #D9D9D9 .25pt;
mso-border-themecolor:background1;mso-border-themeshade:217;padding:4.0pt 4.0pt 4.0pt 4.0pt;
background:#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:
242;margin-left:2.85pt;margin-right:0cm'>

<p class=CodeCxSpFirst style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>xhat_ekf1 =
ekf(mms1,xhat_wls1);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>xhat_ekf2 =
ekf(mms1,xhat_wls1);</span></p>

<p class=CodeCxSpLast style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>plot_ekf_mod1_v_mod2(xhat_ekf1,
xhat_ekf2);</span></p>

</div>

<div style='margin-left:12.75pt'>

<div>

<div uid=3D2435CD data-testid="output_9">

<div style='cursor:default'>

<div style='max-width:100%;display:inline-block'>

<div data-dojo-attach-point="graphicsViewNode,backgroundColorNode"
widgetid="uniqName_164_321" id="uniqName_164_321">

<p class=MsoNormal><span style='font-family:Consolas;mso-fareast-font-family:
"Times New Roman";color:#404040;mso-no-proof:yes'><!--[if gte vml 1]><v:shape
 id="Picture_x0020_31" o:spid="_x0000_i1026" type="#_x0000_t75" style='width:351.75pt;
 height:138.75pt;visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image061.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=469 height=185
src="Project_skeletonCode_files/image062.gif" v:shapes="Picture_x0020_31"><![endif]></span><span
style='font-size:12.0pt;line-height:107%;font-family:Consolas;mso-fareast-font-family:
"Times New Roman";color:#404040'><o:p></o:p></span></p>

</div>

</div>

</div>

</div>

</div>

</div>

<p class=Text>As can be seen above, both models performed similarly when using
the EKF for tracking.</p>

<p class=Text>The EKFs live tracking of the target's movement approximated the <span
class=SpellE>actualy</span> movement, but not particularly well. The WLS
snapshot localisation obviously outperformed this method of live tracking.</p>

<div style='mso-element:para-border-div;border:solid #D9D9D9 1.0pt;mso-border-themecolor:
background1;mso-border-themeshade:217;mso-border-alt:solid #D9D9D9 .25pt;
mso-border-themecolor:background1;mso-border-themeshade:217;padding:4.0pt 4.0pt 4.0pt 4.0pt;
background:#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:
242;margin-left:2.85pt;margin-right:0cm'>

<p class=CodeCxSpFirst style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% EKF, UKF &amp; PF </span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>m1 = nl(mms1);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>xhat_ekf1=ekf(m1,xhat_wls1);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>xhat_ukf1=ukf(m1,xhat_wls1);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% xhat_pf1=pf(m1,xhat_wls2,'Np',1000);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>%Plot EKF, UKF and PF</span></p>

<p class=CodeCxSpLast style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>plot_ekf_ukf(xhat_ekf1,
xhat_ukf1);</span></p>

</div>

<div style='margin-left:12.75pt'>

<div>

<div uid=7582E180 data-testid="output_10">

<div style='cursor:default'>

<div style='max-width:100%;display:inline-block'>

<div data-dojo-attach-point="graphicsViewNode,backgroundColorNode"
widgetid="uniqName_164_333" id="uniqName_164_333">

<p class=MsoNormal><span style='font-family:Consolas;mso-fareast-font-family:
"Times New Roman";color:#404040;mso-no-proof:yes'><!--[if gte vml 1]><v:shape
 id="Picture_x0020_32" o:spid="_x0000_i1025" type="#_x0000_t75" style='width:351.75pt;
 height:138.75pt;visibility:visible;mso-wrap-style:square'>
 <v:imagedata src="Project_skeletonCode_files/image063.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img width=469 height=185
src="Project_skeletonCode_files/image064.gif" v:shapes="Picture_x0020_32"><![endif]></span><span
style='font-size:12.0pt;line-height:107%;font-family:Consolas;mso-fareast-font-family:
"Times New Roman";color:#404040'><o:p></o:p></span></p>

</div>

</div>

</div>

</div>

</div>

</div>

<p class=Text>The EKF and UKF performances were remarkably similar, with the
UKF having slightly larger confidence interval - implying a slightly worse
performance than the EKF.</p>

<p class=Text><o:p>&nbsp;</o:p></p>

<h1>Conclusions</h1>

<p class=Text>Though a limited <span class=GramE>amount</span> of experiments
were carried out with respect to snapshot localisation vs tracking, an obvious
conclusion can be drawn. Snapshot localisation is the superior method of target
<span class=SpellE>locaisation</span>. The errors within a tracking <span
class=SpellE>locaisation</span> algorithm accumulate and cause the results to devolve
the longer the algorithm is <span class=SpellE><span class=GramE>deployed.The</span></span>
snapshot has all the information present at once &amp; doesn't deal with the
cumulation of error.</p>

<p class=Text>The generated data measurements were similarly preferable to the
simulated and collected measurements from the Virtual laboratory environment.
Were any of these algorithms to be deployed, they would need a far more robust <span
class=SpellE>preproccessing</span> and data-collection stage, to ensure the
data is as reflective of <span class=GramE>real world</span> conditions, as
possible.</p>

<p class=Text>The bias state and range state TDOA networks obviously differed
in their performance. The pairwise difference method of the range state TDOA
network performed better overall in this experiment, with lower overall CRLBs
as well as the estimators having a higher confidence when computing.</p>

<p class=Text><span class=SpellE>Conversly</span>, the cost of compute times,
more calculations and higher complexity, all favour the TDOA bias state
network. </p>

<p class=Text>The algorithm, dataset, <span class=GramE>model</span> and sensor
network representation will always be chosen based on application specific
constraints. Though some of these outperformed others in this project, it does
not invalidate the use of these other systems, which would be the reasonable
choice in another framework.</p>

<h1>Appendix: Lab code</h1>

<div style='mso-element:para-border-div;border:solid #D9D9D9 1.0pt;mso-border-themecolor:
background1;mso-border-themeshade:217;mso-border-alt:solid #D9D9D9 .25pt;
mso-border-themecolor:background1;mso-border-themeshade:217;padding:4.0pt 4.0pt 4.0pt 4.0pt;
background:#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:
242;margin-left:2.85pt;margin-right:0cm'>

<p class=CodeCxSpFirst style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#ED8E13;mso-no-proof:yes'>function </span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>unbiased_range_est =
remove_meas_bias(meas_range_est, mic_bias)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% unbiased_range_est - unbiased range
measurements</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>unbiased_range_est =
zeros(size(meas_range_est));</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span></span><span style='color:#ED8E13;
mso-no-proof:yes'>for </span><span style='color:black;mso-color-alt:windowtext;
mso-no-proof:yes'>i = 1:size(meas_range_est,1)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:2'>           </span>unbiased_range_est(i,:) =
meas_range_est(i,:) - mic_bias';</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span></span><span style='color:#ED8E13;
mso-no-proof:yes'>end</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#ED8E13;mso-no-proof:yes'>end</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><o:p>&nbsp;</o:p></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#ED8E13;mso-no-proof:yes'>function </span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>meas_range_diff =
get_pairwise_diff_meas(unbiased_range_est, num_diffs, Nmic)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% meas_range_diff - The pairwise
differences between sensor measurements</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>meas_range_diff =
zeros(size(unbiased_range_est,1), num_diffs);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>k = 1;</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span></span><span style='color:#ED8E13;
mso-no-proof:yes'>for </span><span style='color:black;mso-color-alt:windowtext;
mso-no-proof:yes'>i =[1:Nmic]</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:2'>           </span></span><span style='color:#ED8E13;
mso-no-proof:yes'>for </span><span style='color:black;mso-color-alt:windowtext;
mso-no-proof:yes'>j = [i+1:Nmic]</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:3'>                 </span>meas_range_diff(:,k) =
unbiased_range_est(:,i)-unbiased_range_est(:,j);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:3'>                 </span>k= k+1;</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:2'>           </span></span><span style='color:#ED8E13;
mso-no-proof:yes'>end</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span></span><span style='color:#ED8E13;
mso-no-proof:yes'>end</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#ED8E13;mso-no-proof:yes'>end</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><o:p>&nbsp;</o:p></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#ED8E13;mso-no-proof:yes'>function </span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>var_range =
get_pairwise_diff_covar(num_diffs, Nmic, mic_var)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% var_range - The pairwise differences
between microphone variances</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>var_range = zeros(num_diffs,1);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>k = 1;</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span></span><span style='color:#ED8E13;
mso-no-proof:yes'>for </span><span style='color:black;mso-color-alt:windowtext;
mso-no-proof:yes'>i =[1:Nmic]</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:2'>           </span></span><span style='color:#ED8E13;
mso-no-proof:yes'>for </span><span style='color:black;mso-color-alt:windowtext;
mso-no-proof:yes'>j = [i+1:Nmic]</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:3'>                 </span>var_range(k) = mic_var(i) +
mic_var(j);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:3'>                 </span>k= k+1;</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:2'>           </span></span><span style='color:#ED8E13;
mso-no-proof:yes'>end</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span></span><span style='color:#ED8E13;
mso-no-proof:yes'>end</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#ED8E13;mso-no-proof:yes'>end</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><o:p>&nbsp;</o:p></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#ED8E13;mso-no-proof:yes'>function </span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>plot_ekf_ukf(xhat_ekf1, xhat_ukf1)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>hold </span><span style='color:#00CC00;
mso-no-proof:yes'>on</span><span style='color:black;mso-color-alt:windowtext;
mso-no-proof:yes'>;</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>subplot(1,2,1);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>xplot2(xhat_ekf1,</span><span
style='color:#00CC00;mso-no-proof:yes'>'conf'</span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>,90);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>t1 = title(</span><span style='color:#00CC00;
mso-no-proof:yes'>&quot;EKF tracking, with 90% confidence&quot;</span><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>set(t1,</span><span style='color:#00CC00;
mso-no-proof:yes'>'position'</span><span style='color:black;mso-color-alt:windowtext;
mso-no-proof:yes'>,[0 64 0]);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>camroll(-180);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>subplot(1,2,2);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>xplot2(xhat_ukf1,</span><span
style='color:#00CC00;mso-no-proof:yes'>'conf'</span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>,90,</span><span style='color:#00CC00;
mso-no-proof:yes'>'col'</span><span style='color:black;mso-color-alt:windowtext;
mso-no-proof:yes'>,</span><span style='color:#00CC00;mso-no-proof:yes'>'r'</span><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>t2 = title(</span><span style='color:#00CC00;
mso-no-proof:yes'>&quot;UKF tracking, with 90% confidence&quot;</span><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>set(t2,</span><span style='color:#00CC00;
mso-no-proof:yes'>'position'</span><span style='color:black;mso-color-alt:windowtext;
mso-no-proof:yes'>,[0 64 0]);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>camroll(-180);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#ED8E13;mso-no-proof:yes'>end</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><o:p>&nbsp;</o:p></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#ED8E13;mso-no-proof:yes'>function </span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>plot_ekf_mod1_v_mod2(xhat_ekf1,
xhat_ekf2)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>hold </span><span style='color:#00CC00;
mso-no-proof:yes'>on</span><span style='color:black;mso-color-alt:windowtext;
mso-no-proof:yes'>;</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>subplot(1,2,1);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>xplot2(xhat_ekf1,</span><span
style='color:#00CC00;mso-no-proof:yes'>'conf'</span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>,90);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>t1 = title(</span><span style='color:#00CC00;
mso-no-proof:yes'>&quot;Cartesian velocity linear model in 2D MM, EKF
tracking&quot;</span><span style='color:black;mso-color-alt:windowtext;
mso-no-proof:yes'>);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>set(t1,</span><span style='color:#00CC00;
mso-no-proof:yes'>'position'</span><span style='color:black;mso-color-alt:windowtext;
mso-no-proof:yes'>,[0 64 0]);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>camroll(-180);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>subplot(1,2,2);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>xplot2(xhat_ekf2,</span><span
style='color:#00CC00;mso-no-proof:yes'>'conf'</span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>,90,</span><span style='color:#00CC00;
mso-no-proof:yes'>'col'</span><span style='color:black;mso-color-alt:windowtext;
mso-no-proof:yes'>,</span><span style='color:#00CC00;mso-no-proof:yes'>'r'</span><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>t2 = title(</span><span style='color:#00CC00;
mso-no-proof:yes'>&quot;Dead-reckoning of acceleration and yaw rate MM, EKF
tracking&quot;</span><span style='color:black;mso-color-alt:windowtext;
mso-no-proof:yes'>);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>set(t2,</span><span style='color:#00CC00;
mso-no-proof:yes'>'position'</span><span style='color:black;mso-color-alt:windowtext;
mso-no-proof:yes'>,[0 64 0]);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>camroll(-180);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#ED8E13;mso-no-proof:yes'>end</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><o:p>&nbsp;</o:p></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#ED8E13;mso-no-proof:yes'>function </span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>plot_wls_vs_track(xhat1, xhat2)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>subplot(1,2,1)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>p1 = xplot2(xhat1,</span><span
style='color:#00CC00;mso-no-proof:yes'>'conf'</span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>,90);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>hold </span><span style='color:#00CC00;
mso-no-proof:yes'>on</span><span style='color:black;mso-color-alt:windowtext;
mso-no-proof:yes'>;</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>p2 = xplot2(xhat2,</span><span
style='color:#00CC00;mso-no-proof:yes'>'conf'</span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>,90, </span><span style='color:#00CC00;
mso-no-proof:yes'>'col'</span><span style='color:black;mso-color-alt:windowtext;
mso-no-proof:yes'>, </span><span style='color:#00CC00;mso-no-proof:yes'>'r'</span><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>legend([p1,p2],{</span><span
style='color:#00CC00;mso-no-proof:yes'>'TDOA 1'</span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>,</span><span style='color:#00CC00;
mso-no-proof:yes'>'TDOA 2'</span><span style='color:black;mso-color-alt:windowtext;
mso-no-proof:yes'>});</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span></span><span style='color:#28A0ED;
mso-no-proof:yes'>% plot(s_tdoa1);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>title(</span><span style='color:#00CC00;
mso-no-proof:yes'>&quot;TDOA WLS estimates of (collected) noisy measured
data&quot;</span><span style='color:black;mso-color-alt:windowtext;mso-no-proof:
yes'>);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>hold </span><span style='color:#00CC00;
mso-no-proof:yes'>off</span><span style='color:black;mso-color-alt:windowtext;
mso-no-proof:yes'>;</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>subplot(1,2,2)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>img = imread(</span><span style='color:
#00CC00;mso-no-proof:yes'>'TrackMap.png'</span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>image(img);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span>title(</span><span style='color:#00CC00;
mso-no-proof:yes'>&quot;Track Snapshot&quot;</span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>);</span></p>

<p class=CodeCxSpLast style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#ED8E13;mso-no-proof:yes'>end</span></p>

</div>

<h2>Provided Functions</h2>

<div style='mso-element:para-border-div;border:solid #D9D9D9 1.0pt;mso-border-themecolor:
background1;mso-border-themeshade:217;mso-border-alt:solid #D9D9D9 .25pt;
mso-border-themecolor:background1;mso-border-themeshade:217;padding:4.0pt 4.0pt 4.0pt 4.0pt;
background:#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:
242;margin-left:2.85pt;margin-right:0cm'>

<p class=CodeCxSpFirst style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#ED8E13;mso-no-proof:yes'>function </span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>[mic_error, range_est] =
compute_mic_error(tphat, trans_interval, c, graph)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% mic_error - the computed error (m) of
the range estimated from the microphone pulse toa. First we</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% subtract the intervals between each
pulse transmission </span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-spacerun:yes'>    </span>[size_row, size_col] = size(tphat);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-spacerun:yes'>    </span></span><span style='color:#ED8E13;
mso-no-proof:yes'>for </span><span style='color:black;mso-color-alt:windowtext;
mso-no-proof:yes'>i = 1:size_col</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-spacerun:yes'>        </span>interval(1:size_row,i) = trans_interval
* (i-1);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-spacerun:yes'>    </span></span><span style='color:#ED8E13;
mso-no-proof:yes'>end</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-spacerun:yes'>    </span>toa_est = tphat - interval; </span><span
style='color:#28A0ED;mso-no-proof:yes'>% Time of arrival of each individual
pulse including bias due to unknown pulse transmission time</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-spacerun:yes'>    </span>range_est=toa_est*c; </span><span
style='color:#28A0ED;mso-no-proof:yes'>%Range estimate at each pulse including
bias due to unknown pulse transmission time</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-spacerun:yes'>    </span></span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-spacerun:yes'>    </span></span><span style='color:#28A0ED;
mso-no-proof:yes'>% we assign the first sensor has 0 bias, and define the bias
of the</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-spacerun:yes'>    </span></span><span style='color:#28A0ED;
mso-no-proof:yes'>% other sensors relative to the first sensor</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><o:p>&nbsp;</o:p></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-spacerun:yes'>    </span>true_first_meas = mean(toa_est(1,:)); </span><span
style='color:#28A0ED;mso-no-proof:yes'>%% the mean value of the first sensor
toa including unknown transmission time (t + trans), is we assume</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-spacerun:yes'>    </span></span><span style='color:#28A0ED;
mso-no-proof:yes'>%the bias is 0</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-spacerun:yes'> </span></span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-spacerun:yes'>    </span>true_meas = interval + true_first_meas; </span><span
style='color:#28A0ED;mso-no-proof:yes'>%% expected 'true' value of each pulse
time assuming zero bias from sensor 1</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><o:p>&nbsp;</o:p></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-spacerun:yes'>    </span>error_meas = tphat - true_meas; </span><span
style='color:#28A0ED;mso-no-proof:yes'>%% this is bias_i - bias_1 + e_i -e_1</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-spacerun:yes'>    </span>mic_error = error_meas*c;</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span></span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span></span><span style='color:#ED8E13;
mso-no-proof:yes'>if </span><span style='color:black;mso-color-alt:windowtext;
mso-no-proof:yes'>(graph == true)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span><span style='mso-spacerun:yes'>   
</span>figure;</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:2'>           </span>title(</span><span style='color:#00CC00;
mso-no-proof:yes'>&quot;Sensor Error Histograms&quot;</span><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'>)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span><span style='mso-spacerun:yes'>   
</span>subplot(2,4,1)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span><span style='mso-spacerun:yes'>   
</span>histfit(mic_error(1,:),5)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span><span style='mso-spacerun:yes'>   
</span>title(</span><span style='color:#00CC00;mso-no-proof:yes'>'error of
sensor 1'</span><span style='color:black;mso-color-alt:windowtext;mso-no-proof:
yes'>)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span><span style='mso-spacerun:yes'>   
</span>subplot(2,4,2)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span><span style='mso-spacerun:yes'>   
</span>histfit(mic_error(2,:),5)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span><span style='mso-spacerun:yes'>   
</span>title(</span><span style='color:#00CC00;mso-no-proof:yes'>'error of
sensor 2'</span><span style='color:black;mso-color-alt:windowtext;mso-no-proof:
yes'>)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span><span style='mso-spacerun:yes'>   
</span>subplot(2,4,3)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span><span style='mso-spacerun:yes'>   
</span>histfit(mic_error(3,:),5)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span><span style='mso-spacerun:yes'>   
</span>title(</span><span style='color:#00CC00;mso-no-proof:yes'>'error of
sensor 3'</span><span style='color:black;mso-color-alt:windowtext;mso-no-proof:
yes'>)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span><span style='mso-spacerun:yes'>   
</span>subplot(2,4,4)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span><span style='mso-spacerun:yes'>   
</span>histfit(mic_error(4,:),5)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span><span style='mso-spacerun:yes'>   
</span>title(</span><span style='color:#00CC00;mso-no-proof:yes'>'error of
sensor 4'</span><span style='color:black;mso-color-alt:windowtext;mso-no-proof:
yes'>)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span><span style='mso-spacerun:yes'>   
</span>subplot(2,4,5)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span><span style='mso-spacerun:yes'>   
</span>histfit(mic_error(1,:),5)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span><span style='mso-spacerun:yes'>   
</span>title(</span><span style='color:#00CC00;mso-no-proof:yes'>'error of
sensor 5'</span><span style='color:black;mso-color-alt:windowtext;mso-no-proof:
yes'>)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span><span style='mso-spacerun:yes'>   
</span>subplot(2,4,6)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span><span style='mso-spacerun:yes'>   
</span>histfit(mic_error(2,:),5)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span><span style='mso-spacerun:yes'>   
</span>title(</span><span style='color:#00CC00;mso-no-proof:yes'>'error of
sensor 6'</span><span style='color:black;mso-color-alt:windowtext;mso-no-proof:
yes'>)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span><span style='mso-spacerun:yes'>   
</span>subplot(2,4,7)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span><span style='mso-spacerun:yes'>   
</span>histfit(mic_error(3,:),5)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span><span style='mso-spacerun:yes'>   
</span>title(</span><span style='color:#00CC00;mso-no-proof:yes'>'error of
sensor 7'</span><span style='color:black;mso-color-alt:windowtext;mso-no-proof:
yes'>)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span><span style='mso-spacerun:yes'>   
</span>subplot(2,4,8)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span><span style='mso-spacerun:yes'>   
</span>histfit(mic_error(4,:),5)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span><span style='mso-spacerun:yes'>   
</span>title(</span><span style='color:#00CC00;mso-no-proof:yes'>'error of
sensor 8'</span><span style='color:black;mso-color-alt:windowtext;mso-no-proof:
yes'>)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:2'>           </span>pos = get(gcf, </span><span
style='color:#00CC00;mso-no-proof:yes'>'Position'</span><span style='color:
black;mso-color-alt:windowtext;mso-no-proof:yes'>);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:2'>           </span>set(gcf, </span><span
style='color:#00CC00;mso-no-proof:yes'>'Position'</span><span style='color:
black;mso-color-alt:windowtext;mso-no-proof:yes'>,pos+[200 0 1500 0])</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-tab-count:1'>     </span></span><span style='color:#ED8E13;
mso-no-proof:yes'>end</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#ED8E13;mso-no-proof:yes'>end</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><o:p>&nbsp;</o:p></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#ED8E13;mso-no-proof:yes'>function </span><span style='color:black;
mso-color-alt:windowtext;mso-no-proof:yes'>[mic_bias, mic_variance] =
compute_mic_bias(mic_error)</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% mic_bias<span
style='mso-spacerun:yes'>     </span>- the bias of each microphone</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>% mic_variance - the error variance of
each microphone</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#28A0ED;mso-no-proof:yes'>%in the current assumption, the first
sensor is reference sensor, the bias for this is assumed to be 0</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-spacerun:yes'>    </span>mic_bias(:,1) = mean(mic_error,2);</span></p>

<p class=CodeCxSpMiddle style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:black;mso-color-alt:windowtext;mso-no-proof:yes'><span
style='mso-spacerun:yes'>    </span>mic_variance(:,1) = var(mic_error,0,2);</span></p>

<p class=CodeCxSpLast style='margin-left:0cm;mso-add-space:auto;background:
#F2F2F2;mso-background-themecolor:background1;mso-background-themeshade:242'><span
style='color:#ED8E13;mso-no-proof:yes'>end</span></p>

</div>

</div>
