# Copyright:: Copyright 2012 Trimble Navigation Ltd.
# License:: Apache License version 2.0
# Original Author:: Scott Lininger 
#
# Tests the SketchUp Ruby API Menu object.
#
# This file was originally generated by ourdoc.rb, an internal tool we developed
# specifically for outputting support files (documentation, unit tests, etc.)
# from the standard, doxygen-style c++ comments that are embedded into the
# Ruby implementation files. You can find ourdoc.rb alongside these
# implementation files at:
#
# googleclient/sketchup/source/sketchup/ruby
#

require 'test/unit'

# TC_Menu contains unit tests for the Menu class.
#
# API Object::       Menu
# C++ File::         rmenu.cpp
# Parent Class::     Object
# Version::          SketchUp 6.0
#
# An interface to a menu.
#
class TC_Menu < Test::Unit::TestCase

  # Setup for test cases, if required.
  #
  def setup
    def UI::messagebox(params)
      puts 'TESTUP OVERRIDE: UI::messagebox > ' + params.to_s
    end
  end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Menu.add_submenu
  # @file                rmenu.cpp
  #
  # The add_submenu method is used to add a sub-menu to a menu.
  #
  #
  # Args:
  #
  # Returns:
  # - submenu: a Menu object
  #

  # Test the example code that we have in the API documentation.
  def test_add_submenu_api_example
    assert_nothing_raised do
     plugins_menu = UI.menu("Plugins")
     submenu = plugins_menu.add_submenu("Test")
     if (submenu)
       UI.messagebox submenu
     else
       UI.messagebox "Failure"
     end
    end
  end

  # Test edgecases for values passed to this method.
  def test_add_submenu_edgecases
    plugins_menu = UI.menu("Tools")
    submenu = plugins_menu.add_submenu("")
    assert_not_nil(submenu)

    submenu2 = plugins_menu.add_submenu("verylongsubmenumenuverylongsubm" +
                                        "enumenuverylongsubmenumenuveryl" +
                                        "ongsubmenumenuverylongsubmenume" +
                                        "nuverylongsubmenumenuverylongsu" +
                                        "bmenumenuverylongsubmenumenu")
    assert_not_nil(submenu2)
  end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  def test_add_submenu_bad_params
   assert_raise TypeError do
      # bad arguments here that should cause errors
      plugins_menu = UI.menu("Plugins")
      submenu = plugins_menu.add_submenu(747)
   end
  end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Menu.add_item
  # @file                rmenu.cpp
  #
  # The add_item menu item is used to add a menu item to the specified
  # menu.
  #
  # This method takes a block that defines the action to perform when the
  # menu item is selected.
  #
  # The item id that is returned can be used when adding an optional
  # validation procedure for the menu item.
  #
  #
  # Args:
  # - menu: A string name of the menu to add.
  # - procedure: A method that will be invoked when the menu item is
  # selected.
  #
  # Returns:
  # - item_id: a unique numerical item id for the menu

  # Test the example code that we have in the API documentation.
  def test_add_item_api_example
    assert_nothing_raised do
     plugins_menu = UI.menu("Plugins")
     item = plugins_menu.add_item("Test") { test }
     if (item)
       UI.messagebox item
     else
       UI.messagebox "Failure"
     end
    end
  end

  # Test edgecases for values passed to this method.
  def test_add_item_edgecases
     plugins_menu = UI.menu("Plugins")
     item = plugins_menu.add_item("Test") {}
     assert_not_nil(item)
  end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  def test_add_item_bad_params
    assert_raise ArgumentError do
     plugins_menu = UI.menu("Plugins")
     item = plugins_menu.add_item("Plugins")
    end
  end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Menu.add_item
  # @file                rmenu.cpp
  #
  # The add_item is used to add a menu item to the specified
  # menu at a specific index location.
  #
  # This method takes a block that defines the action to perform when the
  # menu item is selected.
  #
  # The item id that is returned can be used when adding an optional
  # validation procedure for the menu item.
  #
  #
  # Args:
  # - menu: A string name of the menu to add.
  # - index: An integer where the menu item will be displayed
  # - procedure: A method that will be invoked when the menu item is
  # selected.
  #
  # Returns:
  # - item_id: a unique numerical item id for the menu

  # ----------------------------------------------------------------------------

  # Test adding item to File Menu for index 0 passed to this method.
  def test_add_item_file_menu_index_0
     file_menu = UI.menu("File")
     item = file_menu.add_item("Test", 0) {}
     assert_not_nil(item)
  end

  # Test adding item to File Menu for a negative index value passed to this
  # method.
  def test_add_item_at_position_file_menu_negative_index
     if not RUBY_PLATFORM.include? 'darwin'
       menu = UI.menu("File")
       item = menu.add_item("Test", -1) {}
       assert_not_nil(item)
     else
       raise("This test case cannot run on Mac due to bug 6162228 - it would cause a crash")
     end
  end

  # Test adding item to Edit Menu for index 0 passed to this method.
  def test_add_item_edit_menu_index_0
     menu = UI.menu("Edit")
     item = menu.add_item("Test", 0) {}
     assert_not_nil(item)
  end

  # Test adding item to Camera Menu for index 0 passed to this method.
  def test_add_item_camera_menu_index_0
     menu = UI.menu("Camera")
     item = menu.add_item("Test", 0) {}
     assert_not_nil(item)
  end

  # Test adding item to Draw Menu for index 0 passed to this method.
  def test_add_item_draw_menu_index_0
     menu = UI.menu("Draw")
     item = menu.add_item("Test", 0) {}
     assert_not_nil(item)
  end

  # Test adding item to Tools Menu for index 0 passed to this method.
  def test_add_item_tools_menu_index_0
     menu = UI.menu("Tools")
     item = menu.add_item("Test", 0) {}
     assert_not_nil(item)
  end

  # Test adding item to Window Menu for index 0 passed to this method.
  def test_add_item_window_menu_index_0
     menu = UI.menu("Window")
     item = menu.add_item("Test", 0) {}
     assert_not_nil(item)
  end

  # Test adding item to Plugins Menu for index 0 passed to this method.
  def test_add_item_plugins_menu_index_0
     menu = UI.menu("Plugins")
     item = menu.add_item("Test", 0) {}
     assert_not_nil(item)
  end

  # Test adding item to Help Menu for index 0 passed to this method.
  def test_add_item_help_menu_index_0
     menu = UI.menu("Help")
     item = menu.add_item("Test", 0) {}
     assert_not_nil(item)
  end

  # Test adding item with numbers as the menu to Tools Menu with index 0
  # passed to this method.
  def test_add_item_tools_numbers
     menu = UI.menu("Tools")
     item = menu.add_item("0123456789", 0) {}
     assert_not_nil(item)
  end

  # Test adding item with funky character as the menu to Tools Menu with index 0
  # passed to this method.
  def test_add_item_tools_funky
     menu = UI.menu("Tools")
     item = menu.add_item("!@#%^&*()_-+={}[]|\:;'""<>,.", 0) {}
     assert_not_nil(item)
  end

  # Test adding item with numbers and character as the menu to Tools Menu with
  # index 0 passed to this method.
  def test_add_item_tools_num_chars
     menu = UI.menu("Tools")
     item = menu.add_item("Chars & # 42ABKZ4&*", 0) {}
     assert_not_nil(item)
  end

  # Test adding item to a submenu using index 0 passed to this method.
  def test_add_item_submenu_submenu_index
     tools_menu = UI.menu("Tools")
     submenu = tools_menu.add_submenu("&Submenu Tests")
     item = submenu.add_item("Zero", 0) {}
     assert_not_nil(item)
  end

  # Test adding item with a command object to File menu, no index position.
  def test_add_item_cmd_file_no_index
     cmd = UI::Command.new("Test") {}
     cmd.menu_text = "File Command"
     item = UI.menu("File").add_item(cmd)
     assert_not_nil(item)
  end

  # Test adding item with a command object to Edit menu, no index position.
  def test_add_item_cmd_edit_no_index
     cmd = UI::Command.new("Test") {}
     cmd.menu_text = "Edit Command"
     item = UI.menu("Edit").add_item(cmd)
     assert_not_nil(item)
  end

  # Test adding item with a command object to View menu, no index position.
  def test_add_item_cmd_view_no_index
     cmd = UI::Command.new("Test") {}
     cmd.menu_text = "View Command"
     item = UI.menu("View").add_item(cmd)
     assert_not_nil(item)
  end

  # Test adding item with a command object to Camera menu, no index position.
  def test_add_item_cmd_camera_no_index
     cmd = UI::Command.new("Test") {}
     cmd.menu_text = "Camera Command"
     item = UI.menu("Camera").add_item(cmd)
     assert_not_nil(item)
  end

  # Test adding item with a command object to Draw menu, no index position.
  def test_add_item_cmd_draw_no_index
     cmd = UI::Command.new("Test") {}
     cmd.menu_text = "Draw Command"
     item = UI.menu("Draw").add_item(cmd)
     assert_not_nil(item)
  end

  # Test adding item with a command object to Tools menu, no index position.
  def test_add_item_cmd_tools_no_index
     cmd = UI::Command.new("Test") {}
     cmd.menu_text = "Tools Command"
     item = UI.menu("Tools").add_item(cmd)
     assert_not_nil(item)
  end

  # Test adding item with a command object to Plugins menu, no index position.
  def test_add_item_cmd_plugins_no_index
     cmd = UI::Command.new("Test") {}
     cmd.menu_text = "Plugins Command"
     item = UI.menu("Plugins").add_item(cmd)
     assert_not_nil(item)
  end

  # Test adding item with a command object to Window menu, no index position.
  def test_add_item_cmd_window_no_index
     cmd = UI::Command.new("Test") {}
     cmd.menu_text = "Window Command"
     item = UI.menu("Window").add_item(cmd)
     assert_not_nil(item)
  end

  # Test adding item with a command object to Help menu, no index position.
  def test_add_item_cmd_help_no_index
     cmd = UI::Command.new("Test") {}
     cmd.menu_text = "Help Command"
     item = UI.menu("Help").add_item(cmd)
     assert_not_nil(item)
  end

  # Test adding item with a command object to File menu index 1.
  def test_add_item_cmd_file_index_1
     cmd = UI::Command.new("Test") {}
     cmd.menu_text = "File Command 1"
     item = UI.menu("File").add_item(cmd, 1)
     assert_not_nil(item)
  end

  # Test adding item with a command object to Edit menu index 1.
  def test_add_item_cmd_edit_index_1
     cmd = UI::Command.new("Test") {}
     cmd.menu_text = "Edit Command 1"
     item = UI.menu("Edit").add_item(cmd, 1)
     assert_not_nil(item)
  end

  # Test adding item with a command object to View menu index 1.
  def test_add_item_cmd_view_index_1
     cmd = UI::Command.new("Test") {}
     cmd.menu_text = "View Command 1"
     item = UI.menu("View").add_item(cmd, 1)
     assert_not_nil(item)
  end

  # Test adding item with a command object to Camera menu index 1.
  def test_add_item_cmd_camera_index_1
     cmd = UI::Command.new("Test") {}
     cmd.menu_text = "Camera Command 1"
     item = UI.menu("Camera").add_item(cmd, 1)
     assert_not_nil(item)
  end

  # Test adding item with a command object to Draw menu index 1.
  def test_add_item_cmd_draw_index_1
     cmd = UI::Command.new("Test") {}
     cmd.menu_text = "Draw Command 1"
     item = UI.menu("Draw").add_item(cmd, 1)
     assert_not_nil(item)
  end

  # Test adding item with a command object to Tools menu index 1.
  def test_add_item_cmd_tools_index_1
     cmd = UI::Command.new("Test") {}
     cmd.menu_text = "Tools Command 1"
     item = UI.menu("Tools").add_item(cmd, 1)
     assert_not_nil(item)
  end

  # Test adding item with a command object to Window menu index 1.
  def test_add_item_cmd_window_index_1
     cmd = UI::Command.new("Test") {}
     cmd.menu_text = "Window Command 1"
     item = UI.menu("Window").add_item(cmd, 1)
     assert_not_nil(item)
  end

  # Test adding item with a command object to Plugins menu index 1.
  def test_add_item_cmd_plugins_index_1
     cmd = UI::Command.new("Test") {}
     cmd.menu_text = "Plugins Command 1"
     item = UI.menu("Plugins").add_item(cmd, 1)
     assert_not_nil(item)
  end

  # Test adding item with a command object to Help menu index 1.
  def test_add_item_cmd_help_index_1
     cmd = UI::Command.new("Test") {}
     cmd.menu_text = "Help Command 1"
     item = UI.menu("Help").add_item(cmd, 1)
     assert_not_nil(item)
  end

  # Test TypeError for first parameter, passing an integer instead or a string
  def test_add_item_typeerror_1
   assert_raise TypeError do
      # Integer instead of String for menu item
      UI.menu("Tools").add_item(1, 0){}
   end
  end

  # Test TypeError only passing an integer
  def test_add_item_first_typeerror_2
   assert_raise TypeError do
      # Passing in just an Integer
      UI.menu("Tools").add_item(1){}
   end
  end

  # Test TypeError passing an array as second parameter
  def test_add_item_first_typeerror_3
   assert_raise TypeError do
      # Passing in just an Integer
      UI.menu("Tools").add_item("Testing", [0]){}
   end
  end

  # Test TypeError only passing an integer
  def test_add_item_first_typeerror_4
   assert_raise TypeError do
     cmd = UI::Command.new("Test") {}
     cmd.menu_text = "Help Command 1"
     item = UI.menu("Help").add_item(1)
   end
  end

  # Test passing in string for second parameter instead of integer
  def test_add_item_nameerror_1
   assert_raise NameError do
      # String instead of Integer for menu index
      UI.menu("Tools").add_item("New Item", s){}
   end
  end

  # Test passing in string for second parameter instead of integer
  def test_add_item_nameerror_2
   assert_raise NameError do
     cmd = UI::Command.new("Test") {}
     cmd.menu_text = "Help Command 1"
     item = UI.menu("Help").add_item("Item", s)
   end
  end

  # Test ArgumentError, missing the Proc
  def test_add_item_argumenterror_1
   assert_raise ArgumentError do
      # Leaving out the Proc block
      UI.menu("Tools").add_item("New Item", 0)
   end
  end

  # Test ArgumentError, missing the Proc
  def test_add_item_argumenterror_2
   assert_raise ArgumentError do
     cmd = UI::Command.new("Test")
     cmd.menu_text = "Help Command 1"
     item = UI.menu("Help").add_item("Item", 0)
   end
  end

  # Test ArgumentError, passing an array for second argument instead of integer
  def test_add_item_argumenterror_3
   assert_raise ArgumentError do
     cmd = UI::Command.new("Test"){}
     cmd.menu_text = "Help Command 1"
     item = UI.menu("Help").add_item("Item", [0])
   end
  end

  # Test ArgumentError, invalid menu name
  def test_add_item_argumenterror_4
   assert_raise ArgumentError do
      # invalid menu name
      UI.menu("Blue").add_item("New Item", 0)
   end
  end

  # Test NoMethodError, misnaming the add_item method
  def test_add_item_nomethoderror
   assert_raise NoMethodError do
      # misnaming the add_item method
      UI.menu("Tools").add_itm("New Item", 0)
   end
  end

  # @par Ruby Method:    Menu.add_separator
  # @file                rmenu.cpp
  #
  # The add_separator method is used to add a menu separator to a menu.
  #
  #
  #
  # Args:
  #
  # Returns:
  # - : nil
  #

  # Test the example code that we have in the API documentation.
  def test_add_separator_api_example
    assert_nothing_raised do
     plugins_menu = UI.menu("Plugins")
     plugins_menu.add_separator
    end
  end

  #These tests do not really apply to add_separator
  ## Test edgecases for values passed to this method.
  #def test_add_separator_edgecases
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_add_separator_bad_params
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Menu.set_validation_proc
  # @file                rmenu.cpp
  #
  # The set_validation_proc method is used to identify the menu validation
  # procedure. Your procedure should return either MF_ENABLED,
  # MF_DISABLED, MF_CHECKED, MF_UNCHECKED, or MF_GRAYED.
  #
  #
  # Args:
  # - menu: A string name of the menu to add.
  # - procedure: A method that will be invoked when the menu item is
  # selected.
  #
  # Returns:
  # - item_id: a unique numerical item id for the menu
  #

  # Test the example code that we have in the API documentation.
  def test_set_validation_proc_api_example
    def testProc
      UI.messagebox "Ciao"
    end
    assert_nothing_raised do
     plugins_menu = UI.menu("Plugins")
     item = plugins_menu.add_item("Test") {
       return MF_GRAYEDTEST
     }
     UI.messagebox item
     begin
       status = plugins_menu.set_validation_proc(item)  { testProc }
     rescue
       UI.messagebox $!.message
     end
    end
  end

  # Test edgecases for values passed to this method.
  def test_set_validation_proc_edgecases
   assert_nothing_raised do
     plugins_menu = UI.menu("Plugins")
     item = plugins_menu.add_item("Test") {
       return MF_GRAYEDTEST
     }
     status = plugins_menu.set_validation_proc(item) {}
   end

  end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  def test_set_validation_proc_bad_params

    assert_raise ArgumentError do
     plugins_menu = UI.menu("Plugins")
     item = plugins_menu.add_item("Test") {
       return MF_GRAYEDTEST
     }
     status = plugins_menu.set_validation_proc(item)
    end
  end

end
