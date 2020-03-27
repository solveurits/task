*** Variables ***
#MENU
${SETTINGS}    //a[@href='/settings']
${NEW ARTICLE}    //a[@href='/editor']
${HOME}    //a[normalize-space()='Home']

# TAB
${GLOBAL FEED TAB}    //a[normalize-space()='Global Feed']

# New Article
${ARTICLE TITLE}    //input[@formcontrolname='title']
${ARTICLE DESCRIPTION}    //input[@formcontrolname='description']
${ARTICLE BODY}    //textarea[@formcontrolname='body']
${ARTICLE TAGS}    //input[@placeholder='Enter tags']
${PUBLISH ARTICLE}    //button[normalize-space()='Publish Article']


# SELECT TAG
${SELECT TAG}    //div[@class="tag-list"]//a[normalize-space()='tags']
${TAG ACTIVE}    //a[normalize-space()='tags' and contains(@class,'active')]    

# Verify Article Details
${ARTICLE TITLE DETAIL}    //app-article-meta[.//a[@class='author' and normalize-space()='user']]/following-sibling::a/h1
${ARTICLE DESCRIPTION DETAIL}    //app-article-meta[.//a[@class='author' and normalize-space()='user']]/following-sibling::a/p
 
# Article List
${ARTICLE LIST}    //app-article-list//app-article-preview