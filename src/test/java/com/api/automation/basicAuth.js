function auth(cred) {
    const info = `${cred.username}:${cred.password}`;
    const Base64  = Java.type("java.util.Base64");
    const encodedStr = Base64.getEncoder().encodeToString(info.getBytes());
    return `Basic ${encodedStr}`
}