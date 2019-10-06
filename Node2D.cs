using Godot;
using System;

public class Node2D : Godot.Node2D
{
    // Called when the node enters the scene tree for the first time.
    public override void _Ready()
    {
		GD.Print("Hello World");
    }
}
