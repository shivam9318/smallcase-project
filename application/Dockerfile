# Use a minimal base image
FROM python:3.9-slim

# Create non-root user
RUN addgroup --system appgroup && adduser --system --ingroup appgroup appuser

# Set working directory
WORKDIR /app

# Copy only necessary files
COPY app.py .

# Install dependencies
RUN pip install --no-cache-dir --upgrade pip Flask

# Set permissions
RUN chown -R appuser:appgroup /app

# Switch to non-root user
USER appuser

# Expose port
EXPOSE 8081

# Start the app
CMD ["python", "app.py"]

