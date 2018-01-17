Create proc [dbo].[Search](@searchKey varchar(100)) as begin select p.Description,p.Price,p.ProductId,p.ProductImage, p.ProductName, c.CategoryName from Product p  join Category c on p.CategoryId=c.CategoryId where p.IsActive=1 and p.IsDelete=0 and c.IsActive=1 and c.IsDelete=0 and (p.ProductName like '%'+@searchKey+'%' or c.CategoryName like '%'+@searchKey+'%') end

