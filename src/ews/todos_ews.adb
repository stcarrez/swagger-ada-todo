with Servlet.Server.EWS;
with todos.Server;
procedure todos_EWS is
   Container : Servlet.Server.EWS.EWS_Container;
begin
   todos.Server (Container);
end todos_EWS;
