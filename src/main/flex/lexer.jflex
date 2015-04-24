import java.util.ArrayList
%%
%public
%class Lexer
%standalone

%{
    private List<String> tokens = new ArrayList<>();
%}

%{
   public List<String> analizar(String archivo){
             FileReader in = null;
            try{
               in= new FileReader(archivo);
               Lexer lexer = new Lexer(in);
               while(!lexer.zzAtEOF){
                     lexer.yylex();
                }
            }catch (Exceotion ex){
             System.out.println("Error al analizar ");
            }finally{
             try{
                in.close();
             }catch(Exception ex){
            System.out.println("Error al cerrar archivo ");
            }
        }
    }
%}
%%
":"    {tokens.add(":"); System.out.println("Dos puntos");
">"     {tokens.add(">"); System.out.println("Mayor");
"<"    {tokens.add("<"); System.out.println("Menor");
"=="   {tokens.add("=="); System.out.println("Igual");
"%%"   {tokens.add("%%"); System.out.println("Mod");
"[_a-zA-Z][A-Za-z]*" {tokens.add("_+[A-Z]"); System.out.println("ID");
"[0-9]+"  {tokens.add("[0-9]"); System.out.println("Num");  