# Tunar's Minecraft Server Tweaks



These are my settings for minecarft server that i use for 2-6 people.




1.  **Clone/Copy**: Copy the contents of this folder into your server's root directory.
2.  **Permissions**: Ensure the scripts are executable:
    ```bash
    chmod +x start.sh stop.sh plugins/ChunkyLoad.sh
    ```
3.  **Startup**: Run the server using `./start.sh`. 
4.  **Shutdown**: Use `./stop.sh` to safely stop the server running in a `screen` session.

## 🛠️ Key Optimizations

-   **Aikar's Flags**: The `start.sh` script includes industry-standard flags for minimizing GC lag spikes.
-   **Pre-generation**: Use the `plugins/commands.md` guide with Chunky to pre-generate chunks before opening the server to players. This significantly reduces CPU load during exploration.
-   **Performance Configs**: `paper-world-defaults.yml` and `spigot.yml` have been tuned for better entity tracking and chunk loading performance.

## 📝 Notes
-   The `server.properties` is configured for **Offline Mode** (`online-mode=false`).
-   The startup script is configured for a folder named `Server` at `/home/ubuntu/Server`. Adjust `SERVER_DIR` in `start.sh` if your path is different.
