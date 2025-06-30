import React, { useState, useContext } from 'react';
import { useNavigate } from 'react-router-dom';
import { AuthContext } from '../../contexts/AuthContext';
import './../../styles/auth/login.css';

const LoginPage = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const { login } = useContext(AuthContext);
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await login(username, password);
      if (response.firstLogin) {
        navigate('/change-password');
      } else {
        navigate('/dashboard');
      }
    } catch (err) {
      setError(err.message);
    }
  };

  return (
    <div className="login-container">
      <div className="container">
        <h1>mySiss</h1>
        <form onSubmit={handleSubmit}>
          <label htmlFor="usuario">Usuario:</label>
          <input
            type="text"
            id="usuario"
            value={username}
            onChange={(e) => setUsername(e.target.value)}
            autoComplete="username"
            required
          />
          
          <label htmlFor="password">Contraseña:</label>
          <input
            type="password"
            id="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            autoComplete="current-password"
            required
          />
          
          <button type="submit" className="button">Ingresar</button>
          {error && <p className="error-message">{error}</p>}
          
          <a 
            href="#reset-password" 
            className="enlace-contrasena"
            onClick={(e) => {
              e.preventDefault();
              navigate('/reset-password');
            }}
          >
            Olvidaste contraseña
          </a>
        </form>
      </div>
    </div>
  );
};

export default LoginPage;