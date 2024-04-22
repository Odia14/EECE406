import React, { useState } from 'react';
import { View, TextInput, Button, StyleSheet, AsyncStorage, Alert } from 'react-native';

const AuthScreen = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [isSignUp, setIsSignUp] = useState(false);

  const handleLogin = async () => {
    try {
      const savedUsername = await AsyncStorage.getItem('username');
      const savedPassword = await AsyncStorage.getItem('password');

      if (savedUsername === username && savedPassword === password) {
        // Navigate to the authenticated screen
        Alert.alert('Success', 'Login Successful');
      } else {
        Alert.alert('Error', 'Invalid username or password');
      }
    } catch (error) {
      console.error('Error logging in:', error);
    }
  };

  const handleSignUp = async () => {
    try {
      await AsyncStorage.setItem('username', username);
      await AsyncStorage.setItem('password', password);
      setIsSignUp(false);
      Alert.alert('Success', 'Sign up successful. You can now login.');
    } catch (error) {
      console.error('Error signing up:', error);
    }
  };

  return (
    <View style={styles.container}>
      <TextInput
        style={styles.input}
        placeholder="Username"
        onChangeText={text => setUsername(text)}
        value={username}
      />
      <TextInput
        style={styles.input}
        placeholder="Password"
        onChangeText={text => setPassword(text)}
        value={password}
        secureTextEntry
      />
      <View style={styles.buttonContainer}>
        <Button
          title={isSignUp ? 'Sign Up' : 'Login'}
          onPress={isSignUp ? handleSignUp : handleLogin}
        />
        <Button
          title={isSignUp ? 'Switch to Login' : 'Switch to Sign Up'}
          onPress={() => setIsSignUp(prevState => !prevState)}
        />
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  input: {
    width: '80%',
    marginBottom: 10,
    padding: 10,
    borderBottomWidth: 1,
  },
  buttonContainer: {
    flexDirection: 'row',
    justifyContent: 'space-around',
    width: '60%',
  },
});

export default AuthScreen;