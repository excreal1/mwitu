import Layout from "./page/Layout";
import Login from "./page/Login";
import Signup from "./page/Signup";
import Profile from "./page/Profile";
import { BrowserRouter, Routes, Route } from "react-router-dom";

const App = () => {
  return (
    <div>
    <BrowserRouter>
      <Routes>
          <Route path = "/" element = { <Layout></Layout> }>
            <Route index element = { <Login></Login> }></Route>
            <Route path = "/signup" element = { <Signup></Signup> } ></Route>
            <Route path = "/profile" element = { <Profile></Profile> }></Route>
          </Route>
      </Routes>
    </BrowserRouter>
    </div>
  )
}

export default App