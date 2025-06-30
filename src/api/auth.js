export const loginUser = async (username, password) => {
  const response = await fetch(`${process.env.REACT_APP_APEX_API_URL}login/`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ username, password_hash: hashPassword(password) })
  });
  return response.json();
};