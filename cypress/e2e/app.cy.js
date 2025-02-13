describe('Post Search App', () => {
    beforeEach(() => {
      cy.visit('/');
    });
  
    it('should load the app and display the title', () => {
      cy.get('a h1').should('contain', 'Post Search').and('be.visible');
    });
  
    it('should load posts on page load', () => {
      cy.intercept('GET', '/api/posts').as('getPosts');
      cy.get('button').click();
      
      cy.wait('@getPosts');
      cy.get('.post').should('have.length.at.least', 1); 
    });
  
    it('should allow searching for posts', () => {
      cy.intercept('GET', '/api/posts?term=gatto').as('searchPosts');
      cy.get('input#search').type('gatto');
      cy.get('button').click();
      
      cy.wait('@searchPosts');
      cy.get('.post').should('have.length.at.least', 1);
    });
  });
  