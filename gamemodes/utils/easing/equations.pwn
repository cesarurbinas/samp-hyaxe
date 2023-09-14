new Float:initial_ease_pos;

stock easeTest(Float:t)
{
	new Float:tmp_valor = (t + 5.0) - 3.5;
	new Float:result = (tmp_valor * 0.2);
	return result;
}