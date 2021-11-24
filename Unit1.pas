unit Unit1;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, WEBLib.Menus, WEBLib.StdCtrls;

type
  TForm1 = class(TWebForm)
    txtMordu: TWebEdit;
    IsListening: TWebCheckBox;
    btnClick: TWebButton;
    procedure btnClickClick(Sender: TObject);
    procedure IsListeningClick(Sender: TObject);
    
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

procedure TForm1.IsListeningClick(Sender: TObject);
begin

      IsListening.Caption := 'Mordu is listening';
//Asm Start
        asm 
          if (annyang){
            var messages = ['🔊 I am the Lieutenant of Barad-dûr', '🔊 I am the Messenger of Mordor', '🔊 I am the Emissary of the Dark Lord', '🔊 I am the Ambassador of Sauron'];

            var commands = {
              'Who are you': introduction,
              'repeat *variable': repeatUser,
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

          // Tell KITT to use annyang
              SpeechKITT.annyang();

          // Define a stylesheet for KITT to use
              SpeechKITT.setStylesheet('//cdnjs.cloudflare.com/ajax/libs/SpeechKITT/1.0.0/themes/flat.css');

          // Render KITT's interface
              SpeechKITT.vroom();

          // Show Kitt as an extra button
              SpeechKITT.show();

          //Set the text for the toggle button's label.
          SpeechKITT.setInstructionsText('Try these commands: ');

          //Show the users some commands
          SpeechKITT.setSampleCommands(['"Who are you?"', '"Repeat!"']);

          //Start Listening
              annyang.start();
          }
    end;

if(IsListening.Checked = False) then
    begin
  IsListening.Caption := 'Mordu is not listening';

  asm 
    //Stop Listening 
      if (annyang){
        annyang.abort();
        SpeechKITT.hide() 
      }
  end;
  
end

end;

procedure TForm1.btnClickClick(Sender: TObject);
begin

if repeatSentence <> String.Empty then
  begin
    btnClick.Caption := 'This is what you told Mordu!';
    txtMordu.Text := repeatSentence;
  end

else
  ShowMessage('You didn''t talk to Mordu yet');

end;

end.     