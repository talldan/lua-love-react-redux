#Lua-Love-React-Redux#

A very basic example project, with in-development react.js/redux.js style 
adaptations for Lua. All wrapped around the Love game framework, which is used 
for rendering.

Developed without ever really looking at the react source code, though it does 
follow the redux source more closely, as I had less experience as a user of 
redux.

This is intended as a personal project, and I will probably diverge from the 
react/redux approach I've currently taken to explore other solutions.


React - https://github.com/facebook/react
Redux - https://github.com/reactjs/redux


##To build##

Install love, and ensure you can execute the `love` command
https://love2d.org/wiki/Main_Page

Run `love ./` from the `src` folder


##Differences to React##

- API is different
- No JSX!
- No component state
- No context
- No virtual dom
- No classes as components, only pure functions as components
- No propType validation
- Potential bugs in rendering when swapping siblings around
- No tests yet


##Differences to Redux##

- Missing a lot of the nice functions like combineReducers
- No middleware
- Not yet tackled any form of immutability in Lua tables


##Project structure##

###./src/components###

This folder contains all of the 'react' style components. The `love` folder 
contains components that are meant to be the leaf nodes in the rendering tree, 
and produce the outputted state for rendering.

This folder could be split up further.


###./src/constants###

Doesn't need too much explanation - a place to define constants and
configuration data

defaultState.lua is the default state for the store.


###./src/helpers###

A place for helper functions. At the moment this contains loopHandlers.lua a 
small utility for registering multiple handlers for love's load, update, draw
callback functions.


###./src/reducers###

Redux reducers


###./src/rendering###

declare.lua contains the `declare` function, which is similar to perhaps 
`React.createClass`. At the moment all it does is act as a higher order
function to provide property validation in the future, so it's completely
optional.

draw.lua contains the `draw` function, which I guess would be similar to
ReactDOM.render, except there's no need to mount since there is no DOM.

The primitives folder contains logic for rendering each of the things in the
./src/components/love folder


###./src/store###

createStore.lua contains the `createStore` function, which is used for, er, 
creating a store!

connect.lua contains the `connect` function for connecting the store to
components