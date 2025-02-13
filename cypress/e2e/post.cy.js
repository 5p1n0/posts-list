describe('Post Component', () => {
  beforeEach(() => {
    cy.visit('/');
    cy.get('button').click();
  });

  it('should display post title and content', () => {
    cy.get('.post h2').first().should('be.visible');
  });

  it('should display tags if available', () => {
    cy.get('.post .tags').should('exist');
    cy.get('.post .tag').should('have.length.at.least', 1);
  });
});
