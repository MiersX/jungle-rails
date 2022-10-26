describe("product details path", () => {

  it("should visit root", () => {
    cy.visit("/");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Should navigate to 'Scented Blade' plant", () => {
    cy.contains('article[data-testid="plant"]', "Scented Blade")
      .click()
    cy.url().should("include", "/products/2")
  })



})