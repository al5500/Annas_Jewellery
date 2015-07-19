Anna’s Jewellery

Product:
Anna’s Jewellery is a site created for customers to be able to buy jewellery.
Based on an eBay store. Customers will have to be able to sign up to the site, have an account and add items of jewellery to their cart and then checkout!

ADMIN:
Be able to upload Jewellery to site to sell.

USER:
Able to view jewellery without signing up but to purchase must become a member of the site.
Member adds items to cart, before checking out.

Framework:
  Ruby + Rails
  Javascript + jQuery
  HTML
  CSS
  Bootstrap

API’S:
  Stripe
  Cloudinary
  Mandrill

GEMS:
  Bcrypt(Authentication)
  Bootstrap
  Cloudinary
  Mandrill
  Slick
  Stripe


Models:
  -User 
  -Category <— Has many products 
  -Product <— Belongs to Category
  -Cart <— has many lineItems
  -line Item <— Belongs to product, cart
————————————————————————————————————————————— 
User:
  -Name:string
  -email:string
  -password_digest:string
  -admin:boolean
  -address:string
  -suburb:string
  -city:string
  -sate:string
  -postcode:integer
  -country:string

Category:
  -name:string
  -
Product:
  -name:string
  -description:text
  -category:id
  -cl_id:string
  -image:one
  -image:two
  -category_id
  -price:decimal
  -highlighted:boolean
  -available:boolean
  -quantity:integer
  -on_sale:boolean
  -list_price:decimal
  -postage:decimal

Cart:
  -lineitem id

LineItem:
  -cart_id:integer
  -product_id:integer
  -quantity:integer
  