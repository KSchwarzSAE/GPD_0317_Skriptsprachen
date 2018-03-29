using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MoonSharp.Interpreter;

public class CubeProxy
{

	private Cube m_cube;

	[MoonSharpHidden]
	public CubeProxy(Cube _cube)
	{
		m_cube = _cube;
	}

	public void MoveForward()
	{
		m_cube.Forward ();
	}

	public void MoveLeft()
	{
		m_cube.Left ();
	}

	public int test(int _a, string _b)
	{
		Debug.Log ("A: " + _a + " B: " + _b);

		return 54;
	}

}

public class Cube : MonoBehaviour
{

	public float speed;

	private Script m_script;

	private DynValue m_func;

	public void Forward()
	{
		transform.Translate (Vector3.forward * speed * Time.deltaTime);
	}

	public void Backwards()
	{
		transform.Translate (Vector3.forward * speed * Time.deltaTime * -1.0f);
	}

	public void Up()
	{
		transform.Translate (Vector3.up * speed * Time.deltaTime);
	}

	public void Down()
	{
		transform.Translate (Vector3.up * speed * Time.deltaTime * -1.0f);
	}

	public void Right()
	{
		transform.Translate (Vector3.right * speed * Time.deltaTime);
	}

	public void Left()
	{
		transform.Translate (Vector3.right * speed * Time.deltaTime * -1.0f);
	}

	private void Awake()
	{
		UserData.RegisterProxyType<CubeProxy, Cube> ((Cube c) => new CubeProxy (c));

		Script.DefaultOptions.DebugPrint = Debug.Log;

		Reload ();
		m_func.Coroutine.AutoYieldCounter = 100;
	}

	public void Reload()
	{
		try {
			m_script = new Script (CoreModules.Preset_HardSandbox | CoreModules.Coroutine);
			m_script.Globals ["cube"] = this;
			m_func = m_script.CreateCoroutine(m_script.LoadFile ("cube"));
		} catch(SyntaxErrorException e) {
			Debug.Log ("Your Lua Syntax has an Error => " + e.DecoratedMessage);
		}
	}

	private void Update()
	{
		if (Input.GetKeyDown (KeyCode.Space))
			Reload ();
		
		try {
			m_func.Coroutine.Resume ();
		} catch(ScriptRuntimeException e) {
			Debug.Log ("An Error occurred in Lua => " + e.DecoratedMessage);
		}
	}

}