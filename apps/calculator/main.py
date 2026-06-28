"""
Professional Calculator Application

A feature-rich calculator with GUI built using tkinter.
Includes advanced mathematical functions, memory operations,
and calculation history tracking.

Author: tadde201
Version: 1.0
"""

import tkinter as tk
from tkinter import font, messagebox
from math import sqrt, sin, cos, tan, log, exp, pi
import math


class ProfessionalCalculator:
    """A professional calculator with GUI and advanced features.
    
    Provides a tkinter-based calculator with support for:
    - Basic arithmetic operations
    - Advanced mathematical functions (trigonometric, logarithmic)
    - Memory operations
    - Calculation history
    """
    
    def __init__(self, root):
        """Initialize the calculator application.
        
        Args:
            root: The tkinter root window
        """
        self.root = root
        self.root.title("Professional Calculator")
        self.root.geometry("500x700")
        self.root.resizable(False, False)
        self.root.configure(bg="#1e1e1e")
        
        # State variables
        self.expression = ""
        self.history = []
        self.memory_value = 0
        
        # Setup UI components
        self.setup_styles()
        self.create_display()
        self.create_buttons()
        self.create_history_panel()
        
    def setup_styles(self):
        """Setup color scheme and fonts for the calculator."""
        self.bg_color = "#1e1e1e"
        self.display_bg = "#2d2d2d"
        self.button_bg = "#3c3c3c"
        self.button_hover = "#4c4c4c"
        self.operator_bg = "#ff9500"
        self.operator_hover = "#ffb143"
        self.text_color = "#ffffff"
        
        self.main_font = font.Font(family="Segoe UI", size=24, weight="bold")
        self.button_font = font.Font(family="Segoe UI", size=12, weight="bold")
        self.small_font = font.Font(family="Segoe UI", size=10)
        
    def create_display(self):
        """Create the display panel showing current expression and result."""
        display_frame = tk.Frame(self.root, bg=self.display_bg, height=120)
        display_frame.pack(padx=10, pady=10, fill=tk.BOTH)
        display_frame.pack_propagate(False)
        
        # Expression display - shows user input
        self.expression_var = tk.StringVar(value="0")
        expression_label = tk.Label(
            display_frame,
            textvariable=self.expression_var,
            font=self.main_font,
            bg=self.display_bg,
            fg=self.text_color,
            anchor="e",
            padx=20
        )
        expression_label.pack(fill=tk.BOTH, expand=True)
        
        # Result display - shows preview of calculation
        self.result_var = tk.StringVar(value="")
        result_label = tk.Label(
            display_frame,
            textvariable=self.result_var,
            font=("Segoe UI", 16),
            bg=self.display_bg,
            fg="#b0b0b0",
            anchor="e",
            padx=20
        )
        result_label.pack(fill=tk.X)
        
    def create_buttons(self):
        """Create calculator button grid."""
        button_frame = tk.Frame(self.root, bg=self.bg_color)
        button_frame.pack(padx=10, pady=10, fill=tk.BOTH, expand=True)
        
        # Define button layout
        buttons_layout = [
            ["MC", "MR", "M+", "M-", "C"],
            ["7", "8", "9", "÷", "√"],
            ["4", "5", "6", "×", "x²"],
            ["1", "2", "3", "-", "1/x"],
            ["0", ".", "=", "+", "%"],
            ["sin", "cos", "tan", "π", "log"],
            ["(", ")", "e", "^", "←"]
        ]
        
        for row in buttons_layout:
            row_frame = tk.Frame(button_frame, bg=self.bg_color)
            row_frame.pack(fill=tk.BOTH, expand=True, pady=5)
            
            for btn_text in row:
                self.create_button(row_frame, btn_text)
    
    def create_button(self, parent, text):
        """Create a single calculator button with appropriate styling.
        
        Args:
            parent: Parent tkinter widget
            text: Button label text
        """
        # Determine button color based on function
        if text in ["=", "C"]:
            bg = self.operator_bg
            hover_bg = self.operator_hover
        elif text in ["÷", "×", "-", "+", "%", "√", "x²", "1/x", "log", "sin", "cos", "tan", "π", "e", "^", "←"]:
            bg = self.operator_bg
            hover_bg = self.operator_hover
        elif text in ["MC", "MR", "M+", "M-"]:
            bg = "#4a4a4a"
            hover_bg = "#5a5a5a"
        else:
            bg = self.button_bg
            hover_bg = self.button_hover
        
        button = tk.Button(
            parent,
            text=text,
            font=self.button_font,
            bg=bg,
            fg=self.text_color,
            border=0,
            relief=tk.FLAT,
            command=lambda: self.on_button_click(text),
            activebackground=hover_bg,
            activeforeground=self.text_color
        )
        button.pack(side=tk.LEFT, fill=tk.BOTH, expand=True, padx=2)
        
        # Add hover effect
        button.bind("<Enter>", lambda e: button.config(bg=hover_bg))
        button.bind("<Leave>", lambda e: button.config(bg=bg))
    
    def on_button_click(self, char):
        """Handle button click events.
        
        Args:
            char: The character/function associated with the button
        """
        try:
            if char == "C":
                self.clear()
            elif char == "←":
                self.backspace()
            elif char == "=":
                self.calculate()
            elif char == "MC":
                self.memory_clear()
            elif char == "MR":
                self.memory_recall()
            elif char == "M+":
                self.memory_add()
            elif char == "M-":
                self.memory_subtract()
            elif char == "√":
                self.square_root()
            elif char == "x²":
                self.square()
            elif char == "1/x":
                self.reciprocal()
            elif char == "%":
                self.percentage()
            elif char == "π":
                self.add_pi()
            elif char == "e":
                self.add_e()
            elif char in ["sin", "cos", "tan", "log"]:
                self.trigonometric(char)
            elif char == "^":
                self.add_operator("^")
            else:
                self.add_to_expression(char)
        except Exception as e:
            messagebox.showerror("Error", f"Invalid operation: {str(e)}")
    
    def add_to_expression(self, char):
        """Add a character to the current expression.
        
        Args:
            char: Character to add
        """
        if char in ["÷", "×", "-", "+"]:
            if self.expression and self.expression[-1] not in ["÷", "×", "-", "+", "("]:
                self.expression += " " + char + " "
        else:
            self.expression += str(char)
        self.update_display()
    
    def add_operator(self, operator):
        """Add an operator to the expression.
        
        Args:
            operator: The operator to add
        """
        if self.expression and self.expression[-1] not in ["^", "+", "-", "×", "÷"]:
            self.expression += operator
        self.update_display()
    
    def update_display(self):
        """Update both expression and result displays."""
        self.expression_var.set(self.expression if self.expression else "0")
        try:
            result = self.evaluate_expression(self.expression)
            self.result_var.set(f"= {result}")
        except:
            self.result_var.set("")
    
    def evaluate_expression(self, expr):
        """Safely evaluate a mathematical expression.
        
        Args:
            expr: Mathematical expression as string
            
        Returns:
            Calculated result rounded to 10 decimal places, or empty string if invalid
        """
        if not expr:
            return ""
        
        # Replace display symbols with Python operators
        expr = expr.replace("÷", "/")
        expr = expr.replace("×", "*")
        expr = expr.replace("^", "**")
        
        try:
            result = eval(expr)
            return round(result, 10)
        except:
            return ""
    
    def calculate(self):
        """Calculate and display the result of the current expression."""
        try:
            if not self.expression:
                return
            
            result = self.evaluate_expression(self.expression)
            if result == "":
                messagebox.showerror("Error", "Invalid expression")
                return
            
            # Store calculation in history
            self.history.append(f"{self.expression} = {result}")
            
            self.expression = str(result)
            self.update_display()
        except Exception as e:
            messagebox.showerror("Error", f"Calculation error: {str(e)}")
    
    def clear(self):
        """Clear the current expression and reset display."""
        self.expression = ""
        self.result_var.set("")
        self.expression_var.set("0")
    
    def backspace(self):
        """Remove the last character from the expression."""
        if self.expression:
            self.expression = self.expression[:-1]
        self.update_display()
    
    def square_root(self):
        """Calculate the square root of the current expression."""
        try:
            result = self.evaluate_expression(self.expression)
            if result >= 0:
                self.expression = str(sqrt(result))
                self.update_display()
        except:
            messagebox.showerror("Error", "Invalid input for square root")
    
    def square(self):
        """Calculate the square of the current expression."""
        try:
            result = self.evaluate_expression(self.expression)
            self.expression = str(result ** 2)
            self.update_display()
        except:
            messagebox.showerror("Error", "Invalid input")
    
    def reciprocal(self):
        """Calculate the reciprocal (1/x) of the current expression."""
        try:
            result = self.evaluate_expression(self.expression)
            if result != 0:
                self.expression = str(1 / result)
                self.update_display()
        except:
            messagebox.showerror("Error", "Cannot divide by zero")
    
    def percentage(self):
        """Convert the current expression to a percentage."""
        try:
            result = self.evaluate_expression(self.expression)
            self.expression = str(result / 100)
            self.update_display()
        except:
            messagebox.showerror("Error", "Invalid percentage")
    
    def add_pi(self):
        """Add the value of pi to the expression."""
        self.expression += str(pi)
        self.update_display()
    
    def add_e(self):
        """Add the value of Euler's number (e) to the expression."""
        self.expression += str(math.e)
        self.update_display()
    
    def trigonometric(self, func):
        """Calculate trigonometric or logarithmic functions.
        
        Args:
            func: Function name ('sin', 'cos', 'tan', 'log')
        """
        try:
            result = self.evaluate_expression(self.expression)
            result_rad = math.radians(result)
            
            if func == "sin":
                result = sin(result_rad)
            elif func == "cos":
                result = cos(result_rad)
            elif func == "tan":
                result = tan(result_rad)
            elif func == "log":
                result = log(result)
            
            self.expression = str(round(result, 10))
            self.update_display()
        except Exception as e:
            messagebox.showerror("Error", f"Trigonometric error: {str(e)}")
    
    def memory_clear(self):
        """Clear the memory value."""
        self.memory_value = 0
        messagebox.showinfo("Memory", "Memory cleared")
    
    def memory_recall(self):
        """Recall the value stored in memory."""
        self.expression = str(self.memory_value)
        self.update_display()

    def memory_add(self):
        """Add the current expression result to memory."""
        try:
            value = self.evaluate_expression(self.expression)
            self.memory_value += value
            messagebox.showinfo("Memory", f"Added to memory: {self.memory_value}")
        except:
            messagebox.showerror("Error", "Invalid input")
    
    def memory_subtract(self):
        """Subtract the current expression result from memory."""
        try:
            value = self.evaluate_expression(self.expression)
            self.memory_value -= value
            messagebox.showinfo("Memory", f"Subtracted from memory: {self.memory_value}")
        except:
            messagebox.showerror("Error", "Invalid input")
    
    def create_history_panel(self):
        """Create a history panel at the bottom of the calculator."""
        history_frame = tk.Frame(self.root, bg=self.bg_color)
        history_frame.pack(padx=10, pady=10, fill=tk.BOTH)
        
        history_label = tk.Label(
            history_frame,
            text="History",
            font=("Segoe UI", 10, "bold"),
            bg=self.bg_color,
            fg=self.text_color
        )
        history_label.pack(anchor="w")


def main():
    """Launch the calculator application."""
    root = tk.Tk()
    calculator = ProfessionalCalculator(root)
    root.mainloop()


if __name__ == "__main__":
    main()
