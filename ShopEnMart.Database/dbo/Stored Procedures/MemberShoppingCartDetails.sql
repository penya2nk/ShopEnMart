CREATE proc [dbo].[MemberShoppingCartDetails] 
(@memberId int) 
as 
begin 
select cr.CartId, p.Price,p.ProductId,p.ProductImage,p.ProductName,c.CategoryName 
from Cart cr join Product p on p.ProductId=cr.ProductId 
join Category c on c.CategoryId=p.CategoryId 
join Members m on m.MemberId=cr.MemberId where m.MemberId=@memberId 
and cr.CartStatusId=1 end 

