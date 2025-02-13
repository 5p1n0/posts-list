describe('Post Component', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('should display post title and content', () => {
    cy.get('.post h2').first().should('be.visible');
    cy.get('.post p.content').first().should('be.visible');
  });

  it('should display tags if available', () => {
    cy.get('.post .tags').should('exist');
    cy.get('.post .tag').should('have.length.at.least', 1);
  });

  it('should display "No tags available" if post has no tags', () => {
    cy.get('.post .no-tags').should('exist');
  });
});
