unit pend3d;   //main program

interface

uses
 Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, opengl,
  ExtCtrls, StdCtrls, Series, TeEngine, TeeProcs, Chart, Spin, VclTee.TeeGDIPlus;  {OpenGL should be in uses declaration}


type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Button1: TButton;
    Timer2: TTimer;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Button2: TButton;
    GroupBox1: TGroupBox;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    Timer3: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Basics(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure SpinEdit3Change(Sender: TObject);

  private
    { Private declarations }

     { Private-Deklarationen }
   myDC : HDC;
   myRC : HGLRC;
   myPalette : HPALETTE;
   procedure SetupPixelFormat;
  public
    { Public declarations }
  end;


const
mat_specular : array [0..3] of GLfloat = ( 8.0, 8.0, 1.0, 0.0 );
mat_shininess : GLfloat = 40.0;
light_position : array [0..3] of GLfloat = ( 120.6, 14.0, 41.0, 10.7 );


  f0=1.0;
  f1=0.5;
  f2=0.5;
  f3=0.5;

var
  Form1: TForm1;
   rotangle,rotangle1,rotangle2,rotangle3:real;
  xpos,ypos,zpos:real;
  circlepoint:integer;
  angle:real;
  Sphere,cylinder,disk,partialdisk: GLUquadricObj;
  time:extended;
  fix_x,upperlimb,twoupper,cyl:boolean;
  thetadotdot,thetadot,theta,phidotdot,phidot,phi,angleq:real;
  torque,torque1,m,l,g,mint:real;
  k1,k2,k3,k4,dt,k11,k21,k31,k41:real;
  pitch,yaw,roll:real;

implementation

{$R *.dfm}



procedure single_pend_equ(theta,thetadot,phi,phidot:real);

begin
 thetadotdot:=(torque+m*l*l/8*phidot*phidot*sin(theta)*cos(theta)-m*g*l/2*sin(theta))/(m*sqr(l)/4+mint);
 phidotdot:=(torque1-m*l*l/4*phidot*thetadot*sin(theta)*cos(theta))/(m*l*l/8);
end;

procedure rungekutta_single(thetab,thetadotb,phib,phidotb:real);
begin
  dt:=0.0235;
  single_pend_equ(thetab,thetadotb,phib,phidotb);
  k1:=0.5*dt*thetadotdot;
  k11:=0.5*dt*phidotdot;

  single_pend_equ(thetab+0.5*dt*(thetadotb+0.5*k1),thetadotb+k1,phib+0.5*dt*(phidotb+0.5*k11),phidotb+k11);
  k2:=0.5*dt*thetadotdot;
  k21:=0.5*dt*phidotdot;

  single_pend_equ(thetab+0.5*dt*(thetadotb+0.5*k1),thetadotb+k2,phib+0.5*dt*(phidotb+0.5*k11),phidotb+k21);
  k3:=0.5*dt*thetadotdot;
  k31:=0.5*dt*phidotdot;

  single_pend_equ(thetab+dt*(thetadotb+k3),thetadotb+2*k3,phib+dt*(phidotb+k31),phidotb+2*k31);
  k4:=0.5*dt*thetadotdot;
  k41:=0.5*dt*phidotdot;

  theta:=theta+dt*(thetadot+1/3*(k1+k2+k3));
  thetadot:=thetadot+1/3*(k1+2*k2+2*k3+k4);

  phi:=phi+dt*(phidot+1/3*(k11+k21+k31));
  phidot:=phidot+1/3*(k11+2*k21+2*k31+k41);



end;

procedure glBindTexture(target: GLenum; texture: GLuint);
stdcall; external opengl32;
procedure TForm1.SetupPixelFormat;
var    hHeap: THandle;
  nColors, i: Integer;
  lpPalette : PLogPalette;
  byRedMask, byGreenMask, byBlueMask: Byte;
  nPixelFormat: Integer;
  pfd: TPixelFormatDescriptor;
begin
  FillChar(pfd, SizeOf(pfd), 0);
  with pfd do begin
    nSize     := sizeof(pfd);               // Länge der pfd-Struktur
    nVersion  := 1;                         // Version
    dwFlags   := PFD_DRAW_TO_WINDOW or PFD_SUPPORT_OPENGL or
                 PFD_DOUBLEBUFFER;          // Flags
    iPixelType:= PFD_TYPE_RGBA;             // RGBA Pixel Type
    cColorBits:= 32;                        // 32-bit color
    cDepthBits:= 32;                        // 32-bit depth buffer
    iLayerType:= PFD_MAIN_PLANE;            // Layer Type
  end;
  nPixelFormat:= ChoosePixelFormat(myDC, @pfd);
  SetPixelFormat(myDC, nPixelFormat, @pfd);
                                            // Farbpalettenoptimierung wenn erforderlich
  DescribePixelFormat(myDC, nPixelFormat,
                      sizeof(TPixelFormatDescriptor),pfd);
  if ((pfd.dwFlags and PFD_NEED_PALETTE) <> 0) then begin
    nColors  := 1 shl pfd.cColorBits;
    hHeap    := GetProcessHeap;
    lpPalette:= HeapAlloc
       (hHeap,0,sizeof(TLogPalette)+(nColors*sizeof(TPaletteEntry)));
    lpPalette^.palVersion := $300;
    lpPalette^.palNumEntries := nColors;
    byRedMask  := (1 shl pfd.cRedBits) - 1;
    byGreenMask:= (1 shl pfd.cGreenBits) - 1;
    byBlueMask := (1 shl pfd.cBlueBits) - 1;
   for i := 0 to nColors - 1 do begin
      lpPalette^.palPalEntry[i].peRed  :=
        (((i shr pfd.cRedShift)  and byRedMask)  *255)DIV byRedMask;
      lpPalette^.palPalEntry[i].peGreen:=
        (((i shr pfd.cGreenShift)and byGreenMask)*255)DIV byGreenMask;
      lpPalette^.palPalEntry[i].peBlue :=
        (((i shr pfd.cBlueShift) and byBlueMask) *255)DIV byBlueMask;
      lpPalette^.palPalEntry[i].peFlags:= 0;
    end;
    myPalette:= CreatePalette(lpPalette^);
    HeapFree(hHeap, 0, lpPalette);
    if (myPalette <> 0) then begin
      SelectPalette(myDC, myPalette, False);
      RealizePalette(myDC);
    end;
  end;
end;

procedure render;
var
  panjang,panjang1,tp,tl,tt,jarip,jarip1,jarip2,jarispace:real;
begin

 glClearColor(1, 0.8, 0.8, 1.0);
 glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT); //Farb und Tiefenpuffer löschen
 glLoadIdentity;
 glenable(gl_lighting);
 gltranslated(xpos,ypos,zpos);
 glrotate(pitch,0,0,1); //pitch angle sudut dongak  pooros sb z
 glrotate(yaw,0,1,0); //yaw heading angle, poros sumbu y, kiri kanan
 glrotate(roll,1,0,0); //roll angle sudut memutar, sumbu x
 panjang:=3;
 panjang1:=3;
 tp:=1.25;
 tl:=0.5;
 tt:=0.175;
 glrotate(90,1,0,0); //to result pendulum in sagittal plane, z axis rotated around x axis
 //upper arm rotation
  glrotated(rotangle,0,1,0);//sagittal plane xy  around y alias z
 glrotated(rotangle,1,0,0);//frontal plane xy around x axis

  glpushmatrix();
//  gluSphere(sphere,0.5,32 ,32 );  //joint 1 center
  gluCylinder(cylinder, 0.05, 0.05, panjang, 32, 32); // upper arm long cylinder
  gltranslate(0,0,l);
  gluSphere(sphere,1,32 ,32 );//joint 2 center
   glpopmatrix();
swapBuffers(form1.myDC);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
theta:=30*pi/180;
phi:=20*pi/180;
thetadot:=0;
phidot:=0;
m:=1;
l:=3;
g:=9.8;

form1.myDC:= GetDC(Handle);
SetupPixelFormat;
myRC:= wglCreateContext(myDC);
wglMakeCurrent(myDC, myRC);
glEnable(GL_DEPTH_TEST);
glLoadIdentity;

  glClearColor(0.0, 0.0, 0.0, 1.0); 	   // Black Background
  glShadeModel(GL_SMOOTH);                 // Enables Smooth Color Shading
  glClearDepth(1.0);                       // Depth Buffer Setup
  glEnable(GL_DEPTH_TEST);                 // Enable Depth Buffer
  glDepthFunc(GL_LESS);		           // The Type Of Depth Test To Do

  glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);

  glEnable(GL_TEXTURE_2D);

  Sphere := gluNewQuadric();
  cylinder:= gluNewQuadric();
  disk:=glunewquadric();
  partialdisk:=glunewquadric();
  gluQuadricNormals(Sphere, GLU_SMOOTH);   // Create Smooth Normals
  gluQuadricNormals(cylinder, GLU_SMOOTH);   // Create Smooth Normals
  gluQuadricNormals(disk, GLU_SMOOTH);   // Create Smooth Normals

  glMaterialfv(GL_FRONT, GL_SPECULAR, @mat_specular);
  glMaterialfv(GL_BACK, GL_SPECULAR, @mat_specular);
  glMaterialfv(GL_FRONT, GL_SHININESS, @mat_shininess);
   glMaterialfv(GL_BACK, GL_SHININESS, @mat_shininess);
  glLightfv(GL_LIGHT0, GL_POSITION, @light_position);
  glLightfv(GL_LIGHT3, GL_SPECULAR, @mat_specular);
  glLightfv(GL_LIGHT1, GL_POSITION, @light_position);
   glLightfv(GL_LIGHT2, GL_POSITION, @light_position);

  glEnable(GL_LIGHTING);
   glEnable(GL_LIGHT0);
    glEnable(GL_LIGHT1);
     glEnable(GL_LIGHT2);
       glEnable(GL_LIGHT3);
  glDepthFunc(GL_LEQUAL);

rotangle:=0;
rotangle1:=0;
rotangle2:=0;
rotangle3:=0;
xpos:=-1;
ypos:=0;
zpos:=-10;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 series1.Clear;
 series2.clear;

 timer1.Enabled:=true;
 timer2.enabled:=true;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin

 render;
 time:=time+0.01;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin

wglmakecurrent(0,0);
wgldeletecontext(mydc);
releasedc(handle,mydc);
end;

procedure TForm1.FormResize(Sender: TObject);
begin

glViewport(0, 0, Width, Height);    // Setzt den Viewport für das OpenGL Fenster
glMatrixMode(GL_PROJECTION);        // Matrix Mode auf Projection setzen
glLoadIdentity();                   // Reset View
gluPerspective(45.0, Width/Height, 1, 100.0);  // Perspektive den neuen Maßen anpassen.
glMatrixMode(GL_MODELVIEW);         // Zurück zur Modelview Matrix
glLoadIdentity();
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin

//   rotangle1:=90*sin(2*pi*f0*time);
//   rotangle:=90*abs(sin(2*pi*f1*time));
//   rotangle3:=180*abs(sin(2*pi*f2*time));
//
//   rotangle2:=90*abs(sin(0.1*time));
//   series1.addxy(time,rotangle);
//   series2.addxy(time,rotangle3);
//   xpos:= xpos+0.005*cos(rotangle*pi/180);
      rungekutta_single(theta,thetadot,phi,phidot);
      rotangle:= theta*50;
      series1.addxy(time,rotangle);

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 timer2.enabled:=false;
 timer1.enabled:=false;
 cyl:=false;
 twoupper:=false;
 upperlimb:=false;
end;

procedure TForm1.Basics(Sender: TObject);
begin
 twoupper:=true;
 upperlimb:=false;
 timer1.enabled:=true;
 timer2.Enabled:=true;
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
 pitch:=spinedit1.value;
end;

procedure TForm1.SpinEdit2Change(Sender: TObject);
begin
 yaw:=spinedit2.Value;
end;

procedure TForm1.SpinEdit3Change(Sender: TObject);
begin
 roll:=spinedit3.value;
end;



end.
