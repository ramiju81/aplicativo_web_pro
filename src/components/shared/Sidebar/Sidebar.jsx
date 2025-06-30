import React from 'react';
import { Link } from 'react-router-dom';
import './../../styles/shared/sidebar.css';

const Sidebar = () => {
  return (
    <div className="sidebar">
      <div className="sidebar-content">
        <h1>mySiss</h1>
        <Link to="/configuracion">Configuración</Link>
        <Link to="/cargue">Datos Maestros</Link>
        <Link to="/contratos">Contratos</Link>
        <Link to="/honorarios">Honorarios</Link>
        <Link to="/glosas">Glosas</Link>
        <Link to="/auditoria">Auditoría Médica</Link>
      </div>
      <Link to="/logout" className="logout">Cerrar sesión</Link>
    </div>
  );
};

export default Sidebar;