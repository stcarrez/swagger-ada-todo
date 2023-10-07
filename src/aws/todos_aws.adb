with Servlet.Server.Web;
with todos.Server;
procedure todos_AWS is
   Container : Servlet.Server.Web.AWS_Container;
begin
   todos.Server (Container);
end todos_AWS;
