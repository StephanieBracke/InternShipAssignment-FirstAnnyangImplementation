unit Unit1;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, WEBLib.Menus, WEBLib.StdCtrls;

type
  TForm1 = class(TWebForm)
    txtMordu: TWebEdit;
    WebButton1: TWebButton;
    TalkToMordu: TWebButton;
    procedure WebButton1Click(Sender: TObject);
    procedure TalkToMorduClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  repeatSentence : String;

implementation

{$R *.dfm}


procedure TForm1.TalkToMorduClick(Sender: TObject);
var
StopTalking: String;
begin

TalkToMordu.Caption := 'Mordu is listening';

//Asm Start
asm 

if (annyang) 
    {
var messages = ['🔊 I am the Lieutenant of Barad-dûr', '🔊 I am the Messenger of Mordor', '🔊 I am the Emissary of the Dark Lord', '🔊 I am the Ambassador of Sauron'];

        var commands = {
          'Who are you': introduction,
          'repeat *variable': repeatUser
        };

      //Mordu will introduce himself
            function introduction(){
              var randomIndex = Math.round(Math.random() * messages.length);
                alert(messages[randomIndex]);
            }

      //Repeat what the user says
            function repeatUser(userSentence){
              $mod.repeatSentence = userSentence;
            }

      //Add commands
            annyang.addCommands(commands);

      //Start Listening
            annyang.start();
    }

end;

end;

procedure TForm1.WebButton1Click(Sender: TObject);
begin

if repeatSentence <> String.Empty then
  begin
    txtMordu.Text := repeatSentence;
  end

else
  ShowMessage('You didnt talk to mordu yet');

end;

end.  