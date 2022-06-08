describe("Visit home page", () => {
  it("Cart updates if add product button from homepage is clicked", () =>{
    cy.visit('/')
    cy.contains('Add').click({force:true})
    cy.contains("My Cart (1)")
  })
})