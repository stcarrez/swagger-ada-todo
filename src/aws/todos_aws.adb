with Servlet.Server.Web;
with Todos.Server;
procedure Todos_AWS is
   Container : Servlet.Server.Web.AWS_Container;
begin
   Todos.Server (Container);
end Todos_AWS;
