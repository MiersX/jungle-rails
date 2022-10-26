describe("add product to cart", () => {

  it("should visit root", () => {
    cy.visit("/");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Should confirm the cart count is 0", () => {
    cy.get(".nav-link").contains("My Cart (0)")
  })


  it("Should add a Scented blade plant to cart", () => {
    cy.contains('article[data-testid="plant"]', "Scented Blade")
    cy.get('button').contains("Add")
      .click({force: true})
  })

  it("Should confirm the cart count increases on addition", () => {
    cy.get(".nav-link").contains("My Cart (1)")
  })




})