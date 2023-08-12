style = function(){
  
  tags$head(
    tags$style(
      "
      :root {
  --color-primary: #309975;
  --color-secondary: #3ed19e;
  --color-accent: #824670;
  --color-heading: #1b4965;
  --color-text-primary: #313834;
  --color-text-secondary: #757575;
  --color-divider: #bdbdbd;
  --color-icon: #aaffe1;
  --color-body-darker: #353146;
  --color-border: #ccc;
  --border-radius: 30px;
}

*,
*::after,
*::before {
  box-sizing: border-box;
  border: 0;
}

/* Typography */
html {
  font-size: 62.5%;
}

body,
a {
  font-family: 'Montserrat Alternates', sans-serif;
  color: var(--color-body);
  font-size: 1.3rem;
  line-height: 1.5;
  text-decoration: none;
}

h1,
h2,
h3 {
  color: var(--color-heading);
  margin-bottom: 1rem;
  line-height: 1.1;
}

h1 {
  font-size: 3.6rem;
}
h2 {
  font-size: 1.8rem;
}
h3 {
  font-size: 1.6rem;
}

p {
  margin-top: 0;
}

@media screen and (min-width: 575px) {
  body,
  a {
    font-size: 1.4rem;
  }
  h1 {
    font-size: 4.8rem;
  }
  h2 {
    font-size: 2.4rem;
  }
}

@media screen and (min-width: 768px) {
  h1 {
    font-size: 7.2rem;
  }
  h2 {
    font-size: 3rem;
  }
  h3 {
    font-size: 1.8rem;
  }
}

/* End Typography */

.container-fluid {
  margin: 0;
  padding: 0;
}
i {
  padding: 0;
}

.content-wrapper {
  overflow: auto;
  height: calc(100vh-50px);
}

.people-group {
}

.icon {
  margin-right: 1rem;
}

.button {
  margin-top: 2rem;
  font-size: 2rem;
  background-color: #ff8906;
  color: #fffffe;
  outline: none;
  border-radius: 15px;
  box-shadow: 0px 0px 4px 3px rgba(82,76,76,0.75);
}

.button:hover {
  background-color: #e77e06de;
  color: #fffffe;
}

/* Grid */
.grid {
  display: grid;
  width: 100%;
}


@media screen and (min-width: 1200px) {
  .grid--1x2 {
    grid-template-columns: 1fr 1fr;
    gap: 2.5rem;
  }

  
}

.boxc {
  background-color: #00DA91;
  color: #003A4F;
  padding: 2rem;
  border-radius: 2rem;
  box-shadow: 0px 0px 25px 0px rgba(145,127,127,0.75);
}


.boxc p {
  font-size: 1.7rem;
  line-height: 1.1;
}

.boxc h2 {
  font-size: 4.2rem;
  margin-top: 1rem;
  font-weight: 700;
}
/* End Grid */


.box-header::before {
  content: normal;
  
}

.presentImage {
width: 60vw;
margin:auto;
height: 75vh;
overflow: hidden;
}

.presentImage img {
  object-fit: contain;
  height: 70vh;
  overflow: hidden;
}



.middle {
  display: flex;
flex-direction: column;
align-items: center;
margin: auto;
}

.boxa {
justify-content: center;
}

.col-sm-6 {
width: 40%;
margin:auto;
}
.col-sm-10 {
margin:auto;
}

.auto {
  display: flex;
justify-content: center;
align-items: center;
  
}

.pad {
padding:auto;
}

.box-body grid grid--1x2::before{
  display: none;
}

      "
    )
  )
}

