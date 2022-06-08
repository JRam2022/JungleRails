describe("Visit home page", () => {
  it("Can navigate from homepage to product detail page by clicking on product", () =>{
    cy.visit('/')
    cy.get('.products article img').eq(0).click()
  })
})