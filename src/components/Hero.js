import React from "react";
import { useAuth0 } from "@auth0/auth0-react";

const Hero = () => {
  const { user, isAuthenticated } = useAuth0();

  return (
    <div className="text-center hero my-5">
      <h1 className="mb-4">Demo - SignIn with Okta</h1>
      {isAuthenticated && <p>Welcome, {user.name}</p>}
    </div>
  );
};

export default Hero;
